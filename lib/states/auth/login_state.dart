import 'package:flutter/material.dart';
import 'package:foodie/states/auth/login_register_states.dart';

class LoginState extends LoginRegisterStates {
  GlobalKey<FormState> get loginKey => _loginKey;

  static final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
}
