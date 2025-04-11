import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

typedef ResSuccess = Future<void> Function(Map<String, dynamic>);
typedef ResFailure = Future<void> Function(dynamic);

class ServiceCall {
  static void post(Map<String, dynamic> parameter, String path,
      {bool isToken = false, ResSuccess? withSuccess, ResFailure? failure}) {
    Future(() {
      try {
        var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

        // if (isToken) {
        //   headers["token"] = "";
        // }
        var response =
            http.post(Uri.parse(path), headers: headers, body: parameter);

        response.then((result) {
          if (kDebugMode) {
            print(result);
          }
          try {
            final jsonObj = json.decode(result.body) as Map<String, dynamic>;
            if (jsonObj.isNotEmpty) {
              if (withSuccess != null) withSuccess(jsonObj);
            }
          } catch (e) {
            if (failure != null) failure(e.toString());
          }
        }).catchError((err) {
        if (failure != null) failure(err.toString());

        });
      } catch (e) {
        if (failure != null) failure(e.toString());
      }
    });
  }
}
