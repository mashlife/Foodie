import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_button.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/constraints/text_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/auth/reset_otp/change_password_screen.dart';
import 'package:foodie/view/auth/reset_otp/otp_screen.dart';
import 'package:gap/gap.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
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
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: FColor.primaryText,
                  ),
                ),
                const Gap(15),
                Text(
                  'Please enter your email to receive a link to  create a new password via email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: FColor.secondaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const Gap(40),
                FoodieTextfield(
                  controller: emailController,
                  hintText: 'Your Email',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Email is required';
                    } else if (!emailRegExp.hasMatch(val)) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                FoodieButton(
                    onTap: () {
                      //send otp

                      //go to otp verify screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            onTap: () {
                              //verify otp and go to NewPasswordScreen()
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangePasswordScreen()));
                            },
                          ),
                        ),
                      );
                    },
                    btnText: 'Send')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
