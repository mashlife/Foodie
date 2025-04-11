import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/states/auth/login_register_states.dart';

class RegistrationState extends LoginRegisterStates {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //getters
  String get country => _country;
  GlobalKey<FormState> get signupKey => _signupKey;

  static final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  String _country = 'Bangladesh';

  //bools
  bool confirmPasswordNotVisible = true;
  bool checkerVisible = false;
  bool confirmCheckerVisible = false;

  bool containsUppercase = false;
  bool containsLowercase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8length = false;

  //update methods
  void updateCountry(String newCountry) {
    _country = newCountry;
    notifyListeners();
  }

  //password related tasks
  void updatePasswordStrength(String currentPassword) {
    containsUppercase = currentPassword.contains(RegExp(r'[A-Z]'));
    containsLowercase = currentPassword.contains(RegExp(r'[a-z]'));
    containsNumber = currentPassword.contains(RegExp(r'[0-9]'));
    containsSpecialChar = currentPassword
        .contains(RegExp(r'[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]'));
    contains8length = currentPassword.length >= 8;
    notifyListeners();
  }

//TODO: Password Checker only shows up doesn't go away and Cofirm Pass Checker toggle is not working currently. Fix it
  void toggleConfrimPasswordVisibility() {
    confirmPasswordNotVisible = !confirmPasswordNotVisible;
    notifyListeners();
  }

  void passwordCheckVisible(bool visible) {
    checkerVisible = true;
    updatePasswordStrength(passwordController.text);
    notifyListeners();
  }

  void confirmPasswordCheckVisible(bool visible) {
    confirmCheckerVisible = visible;
    updatePasswordStrength(confirmPasswordController.text);
    notifyListeners();
  }

  //clearing the editing of password textfields

  void clearChecker() {
    containsUppercase = false;
    containsLowercase = false;
    containsNumber = false;
    containsSpecialChar = false;
    contains8length = false;
    notifyListeners();
  }

  void clearEditingState() {
    passwordNotVisible = true;
    confirmPasswordNotVisible = true;

    containsUppercase = false;
    containsLowercase = false;
    containsNumber = false;
    containsSpecialChar = false;
    contains8length = false;
    notifyListeners();
  }
}
