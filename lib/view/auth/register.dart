import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/components/foodie_button.dart';
import 'package:foodie/components/foodie_pass_argument_checker.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/states/auth/registration_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/on_boarding/on_boarding_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap, required this.registate});

  final void Function()? onTap;
  final RegistrationState registate;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    //Focus Nodes for OnPasswordFocus
    final passwordFocus = FocusNode();
    final confirmPasswordFocus = FocusNode();

    //Selection Controls
    final passSelection = MaterialTextSelectionControls();
    final confirmPassSelection = MaterialTextSelectionControls();

    @override
    void initState() {
      super.initState();

      passwordFocus.addListener(() {
        if (passwordFocus.hasFocus) {
          widget.registate.passwordCheckVisible(true);
        } else if (!passwordFocus.hasFocus) {
          widget.registate.passwordCheckVisible(false);
          widget.registate.clearEditingState();
        }
      });
      // confirmPasswordFocus.addListener(() {
      //   if (confirmPasswordFocus.hasFocus) {
      //     widget.registate.confirmPasswordCheckVisible(true);
      //   } else {
      //     widget.registate.confirmPasswordCheckVisible(false);
      //     widget.registate.clearEditingState();
      //   }
      // });
    }

    @override
    void dispose() {
      passwordFocus.dispose();
      confirmPasswordFocus.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            splashBg,
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Consumer<RegistrationState>(
            builder: (context, regiState, child) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      logo,
                      height: size.height * 0.12,
                    ),
                    const Gap(20),
                    Form(
                      key: regiState.signupKey,
                      child: Column(
                        children: [
                          FoodieTextfield(
                            controller: regiState.nameController,
                            hintText: 'NAME',
                          ),
                          const Gap(5),
                          FoodieTextfield(
                            controller: regiState.emailController,
                            hintText: 'EMAIL',
                          ),
                          const Gap(5),
                          IntlPhoneField(
                            controller: regiState.phoneController,
                            initialCountryCode: 'BD',
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'MOBILE',
                              hintStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorScheme.tertiary),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: FColor.primary),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onCountryChanged: (country) {
                              regiState.updateCountry(country.name);
                            },
                          ),
                          const Gap(5),
                          //TODO: Password Checker only shows up doesn't go away and Cofirm Pass Checker toggle is not working currently. Fix it
                          FoodieTextfield(
                            controller: regiState.passwordController,
                            hintText: 'PASSWORD',
                            obsecureText: regiState.passwordNotVisible,
                            // focusNode: passwordFocus,
                            onChanged: (pass) {
                              // regiState.clearChecker();
                              regiState.updatePasswordStrength(pass!);
                              regiState.passwordCheckVisible(pass.isNotEmpty);
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                regiState.togglePasswordVisibility();
                              },
                              icon: Icon(
                                regiState.passwordNotVisible
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.password,
                              ),
                            ),
                            selectionControls: passSelection,
                          ),
                          const Gap(5),
                          AnimatedCrossFade(
                            firstChild: const SizedBox.shrink(),
                            secondChild: PasswordChecker(
                              regiState: regiState,
                              focusNode: passwordFocus,
                              onFucoschange: (hasFocus) {
                                if (hasFocus) {
                                  widget.registate.passwordCheckVisible(true);
                                } else {
                                  widget.registate.passwordCheckVisible(false);
                                  widget.registate.clearEditingState();
                                }
                              },
                            ),
                            crossFadeState: regiState.checkerVisible
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 200),
                          ),
                          // PasswordChecker(regiState: regiState),
                          // const Gap(5),
                          FoodieTextfield(
                            controller: regiState.confirmPasswordController,
                            hintText: 'CONFIRM PASSWORD',
                            obsecureText: regiState.confirmPasswordNotVisible,
                            focusNode: confirmPasswordFocus,
                            onChanged: (pass) {
                              // regiState.clearChecker();
                              // regiState.updatePasswordStrength(pass!);
                              // regiState
                              //     .confirmPasswordCheckVisible(pass.isNotEmpty);
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                regiState.toggleConfrimPasswordVisibility();
                              },
                              icon: Icon(
                                regiState.confirmPasswordNotVisible
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.password,
                              ),
                            ),
                          ),
                          // const Gap(5),
                          // AnimatedCrossFade(
                          //   firstChild: const SizedBox.shrink(),
                          //   secondChild: PasswordChecker(
                          //     regiState: regiState,
                          //     focusNode: confirmPasswordFocus,
                          //     onFucoschange: (hasFocus) {
                          //       if (hasFocus) {
                          //         widget.registate.confirmPasswordCheckVisible(true);
                          //       } else {
                          //         widget.registate.confirmPasswordCheckVisible(false);
                          //         widget.registate.clearEditingState();
                          //       }
                          //     },
                          //   ),
                          //   crossFadeState: regiState.confirmCheckerVisible
                          //       ? CrossFadeState.showSecond
                          //       : CrossFadeState.showFirst,
                          //   duration: const Duration(milliseconds: 200),
                          // ),
                          const Gap(14),
                          FoodieButton(
                            onTap: () {
                              // Dispose RegistrationState here after successful registration
                              // Provider.of<RegistrationState>(context, listen: false).dispose();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnBoardingView(),
                                ),
                              );
                            },
                            btnText: 'SIGNUP',
                            type: ButtonType.bgTransparent,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RoundedImageButton(
                          color: const Color(0xff367fc0),
                          imageAsset: facebookLogo,
                          onTap: () {
                            //Login with Facebook
                          },
                        ),
                        const Gap(20),
                        RoundedImageButton(
                          color: const Color(0xffdd4b39),
                          imageAsset: googleLogo,
                          onTap: () {
                            //Login with Google
                          },
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account',
                          style: TextStyle(
                              color: FColor.secondaryText, fontSize: 16),
                        ),
                        const Gap(5),
                        InkWell(
                          onTap: widget.onTap,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: FColor.primaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordChecker extends StatelessWidget {
  const PasswordChecker({
    super.key,
    required this.regiState,
    required this.focusNode,
    required this.onFucoschange,
  });

  final RegistrationState regiState;
  final FocusNode focusNode;
  final void Function(bool)? onFucoschange;
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: onFucoschange,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SinglePassArgumentChecker(
                    text: "⚈  1 uppercase",
                    argument: regiState.containsUppercase),
                SinglePassArgumentChecker(
                    text: "⚈  1 lowercase",
                    argument: regiState.containsLowercase),
                SinglePassArgumentChecker(
                    text: "⚈  1 number", argument: regiState.containsNumber),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SinglePassArgumentChecker(
                    text: "⚈  1 special character",
                    argument: regiState.containsSpecialChar),
                SinglePassArgumentChecker(
                    text: "⚈  8 minimum characters",
                    argument: regiState.contains8length),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
