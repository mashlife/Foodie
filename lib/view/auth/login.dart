import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/components/foodie_button.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/states/auth/login_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/constraints/text_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/auth/reset_otp/reset_password_view.dart';
import 'package:foodie/view/main_tab/main_tab_view.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Builds the login page UI, including text fields for email and password, a forgot password button,
  /// a login button, and a link to the registration page.
  ///
  /// The login page is built using a [Scaffold] widget with a [Container] that centers the login form.
  /// The form includes two [FoodieTextfield] widgets for the email and password inputs, a [TextButton]
  /// for the forgot password link, a [FoodieButton] for the login button, and a row with a link to the
  /// registration page.
  ///
  /// The page also includes a [SvgPicture] widget for the Facebook login button, which is wrapped in an
  /// [InkWell] widget to handle the tap gesture.
  ///
  /// The [LoginPage] widget takes a required [onTap] callback function that is called when the user
  /// taps the "Register Now" link.
  ///
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: 'to login bg',
              child: Image.asset(
                splashBg,
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Consumer<LoginState>(
              builder: (context, loginState, child) => SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                          tag: 'to login logo',
                          child: SvgPicture.asset(
                            logo,
                            height: 100,
                          )),
                      const Gap(25),
                      Form(
                        key: loginState.loginKey,
                        child: Column(
                          children: [
                            FoodieTextfield(
                              controller: loginState.emailController,
                              hintText: 'EMAIL',
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Email is required';
                                } else if (!emailRegExp.hasMatch(val)) {
                                  return 'Email is not valid';
                                }
                                return null;
                              },
                            ),
                            const Gap(10),
                            FoodieTextfield(
                              controller: loginState.passwordController,
                              hintText: 'PASSWORD',
                              obsecureText: loginState.passwordNotVisible,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginState.togglePasswordVisibility();
                                },
                                icon: Icon(
                                  loginState.passwordNotVisible
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.password,
                                ),
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Password is required';
                                } else if (!passwordRexExp.hasMatch(val)) {
                                  return 'Password is not valid';
                                }
                                return null;
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  //Forgot password
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const ResetPasswordView())),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: FColor.secondaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const Gap(9),
                            FoodieButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainTabView()));
                                  if (loginState.loginKey.currentState!
                                      .validate()) {
                                  } else {
                                    print("not okay");
                                  }
                                  // Dispose LoginState here after successful login
                                  // Provider.of<LoginState>(context, listen: false).dispose();
                                },
                                btnText: 'LOGIN'),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Text(
                        '-- or Login With --',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: FColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Gap(14),
                      LoginWithButtons(
                        size: size,
                        color: const Color(0xff367fc0),
                        imageAsset: facebookLogo,
                        text: 'Login with Facebook',
                        onTap: () {
                          //Login with Facebook
                        },
                      ),
                      const Gap(10),
                      LoginWithButtons(
                        size: size,
                        color: const Color(0xffdd4b39),
                        imageAsset: googleLogo,
                        text: 'Login with Google',
                        onTap: () {
                          //Login with Google
                        },
                      ),
                      const Gap(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a user?',
                            style: TextStyle(
                                color: FColor.secondaryText, fontSize: 16),
                          ),
                          const Gap(5),
                          InkWell(
                            onTap: widget.onTap,
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                color: FColor.primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO: Action
  void btnLogin() {}

  //TODO: ServiceCall
  void serviceCallLogin(Map<String, dynamic> userParams) {}
}

class LoginWithButtons extends StatelessWidget {
  const LoginWithButtons({
    super.key,
    required this.size,
    required this.onTap,
    required this.color,
    required this.imageAsset,
    required this.text,
  });

  final Size size;
  final void Function() onTap;
  final Color color;
  final String imageAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(15),
          width: size.width * 0.7,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imageAsset),
              Text(
                text,
                style: TextStyle(
                  color: FColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )),
    );
  }
}
