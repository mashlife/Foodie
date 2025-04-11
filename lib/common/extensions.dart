import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension StateExtension on State {
  void mdShowAlert(
    String title,
    String messege,
    VoidCallback onPressed, {
    String buttonTitle = "Ok",
    TextAlign messegeTextAlign = TextAlign.center,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(
          messege,
          textAlign: messegeTextAlign,
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(buttonTitle),
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
          )
        ],
      ),
    );
  }
}
