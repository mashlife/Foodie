import 'package:flutter/material.dart';
import 'package:foodie/states/auth/login_state.dart';
import 'package:foodie/states/auth/registration_state.dart';
import 'package:foodie/view/auth/login.dart';
import 'package:foodie/view/auth/register.dart';
import 'package:provider/provider.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;
  late RegistrationState regiState;
  late LoginState loginState;

  @override
  void initState() {
    super.initState();
    regiState = RegistrationState();
    loginState = LoginState();
  }

  @override
  void dispose() {
    super.dispose();
    regiState.dispose();
    loginState.dispose();
  }

  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return ChangeNotifierProvider.value(
          value: loginState, child: LoginPage(onTap: togglePage));
    } else {
      return ChangeNotifierProvider.value(
          value: regiState,
          child: RegisterPage(
            onTap: togglePage,
            registate: regiState,
          ));
    }
  }
}
