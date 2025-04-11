import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_button.dart';
import 'package:foodie/components/foodie_pass_argument_checker.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/states/auth/reset_password_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

//TODO: Password Checker only shows up doesn't go away and Cofirm Pass Checker toggle is not working currently. Fix it

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Focus Nodes for OnPasswordFocus
    final passwordFocus = FocusNode();
    final confirmPasswordFocus = FocusNode();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            splashBg,
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: FColor.primaryText,
                  ),
                ),
                const Gap(15),
                ChangeNotifierProvider<ResetPasswordState>(
                  create: (BuildContext context) => ResetPasswordState(),
                  builder: (context, child) {
                    final resetPass = Provider.of<ResetPasswordState>(context);
                    return Form(
                        child: Column(
                      children: [
                        FoodieTextfield(
                          controller: resetPass.passwordController,
                          hintText: 'PASSWORD',
                          obsecureText: resetPass.passwordNotVisible,
                          focusNode: passwordFocus,
                          onChanged: (pass) {
                            resetPass.updatePasswordStrength(pass!);
                            return null;
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              resetPass.togglePasswordVisibility();
                            },
                            icon: Icon(
                              resetPass.passwordNotVisible
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.password,
                            ),
                          ),
                        ),
                        const Gap(5),
                        OnPasswordFocus(
                          resetPass: resetPass,
                          focusNode: passwordFocus,
                          onFocusChange: (hasFucos) {
                            if (hasFucos) {
                              resetPass.passwordCheckVisible(true);
                            } else {
                              resetPass.clearEditingState();
                            }
                          },
                          visibility: resetPass.checkerVisible,
                        ),
                        const Gap(5),
                        FoodieTextfield(
                          controller: resetPass.confirmPasswordController,
                          hintText: 'CONFIRM PASSWORD',
                          obsecureText: resetPass.confirmPasswordNotVisible,
                          focusNode: confirmPasswordFocus,
                          onChanged: (pass) {
                            resetPass.updatePasswordStrength(pass!);
                            return null;
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              resetPass.toggleConfrimPasswordVisibility();
                            },
                            icon: Icon(
                              resetPass.confirmPasswordNotVisible
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.password,
                            ),
                          ),
                        ),
                        const Gap(5),
                        OnPasswordFocus(
                          resetPass: resetPass,
                          focusNode: confirmPasswordFocus,
                          onFocusChange: (hasFucos) {
                            if (hasFucos) {
                              resetPass.confirmPasswordCheckVisible(true);
                            } else {
                              resetPass.clearEditingState();
                            }
                          },
                          visibility: resetPass.confirmCheckerVisible,
                        ),
                        const Gap(14),
                        FoodieButton(
                          onTap: () {
                            //verify password and update password
                            // Dispose ResetPasswordState here after successful password change
                            // Provider.of<ResetPasswordState>(context, listen: false).dispose();
                          },
                          btnText: 'DONE',
                        ),
                      ],
                    ));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnPasswordFocus extends StatelessWidget {
  const OnPasswordFocus({
    super.key,
    required this.focusNode,
    required this.resetPass,
    required this.onFocusChange,
    required this.visibility,
  });

  final FocusNode focusNode;
  final ResetPasswordState resetPass;
  final void Function(bool)? onFocusChange;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      child: AnimatedCrossFade(
        firstChild: const SizedBox.shrink(),
        secondChild: Padding(
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
                      argument: resetPass.containsUppercase),
                  SinglePassArgumentChecker(
                      text: "⚈  1 lowercase",
                      argument: resetPass.containsLowercase),
                  SinglePassArgumentChecker(
                      text: "⚈  1 number", argument: resetPass.containsNumber),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SinglePassArgumentChecker(
                      text: "⚈  1 special character",
                      argument: resetPass.containsSpecialChar),
                  SinglePassArgumentChecker(
                      text: "⚈  8 minimum characters",
                      argument: resetPass.contains8length),
                ],
              ),
            ],
          ),
        ),
        crossFadeState:
            visibility ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
