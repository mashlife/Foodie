import 'package:flutter/material.dart';
import 'package:foodie/services/resturant_service.dart';
import 'package:foodie/services/user_services.dart';
import 'package:foodie/view/on_boarding/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => ResturantServices()),
      ChangeNotifierProvider(create: (BuildContext context) => UserServices()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'metro',
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
