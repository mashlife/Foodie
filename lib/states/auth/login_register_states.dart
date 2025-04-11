import 'package:flutter/material.dart';

class LoginRegisterStates with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordNotVisible = true;

  void togglePasswordVisibility() {
    passwordNotVisible = !passwordNotVisible;
    notifyListeners();
  }
}
