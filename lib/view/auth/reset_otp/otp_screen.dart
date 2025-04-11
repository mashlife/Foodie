import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_button.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final otpPinFieldController = GlobalKey<OtpPinFieldState>();

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
                  'We have sent an OTP to your Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: FColor.primaryText,
                  ),
                ),
                const Gap(15),
                Text(
                  'Please check your mobile number 071*****12 continue to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: FColor.secondaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const Gap(30),
                OtpPinField(
                  key: otpPinFieldController,
                  autoFillEnable: true,

                  ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                  textInputAction: TextInputAction.done,

                  ///in case you want to change the action of keyboard
                  /// to clear the Otp pin Controller
                  onSubmit: (newCode) {
                    print('Entered pin is $newCode');

                    /// return the entered pin
                  },
                  onChange: (text) {
                    print('Enter on change pin is $text');

                    /// return the entered pin
                  },
                  onCodeChanged: (code) {
                    print('onCodeChanged  is $code');
                  },

                  /// to decorate your Otp_Pin_Field
                  otpPinFieldStyle: OtpPinFieldStyle(
                    defaultFieldBorderColor: FColor.placeHolder,
                    activeFieldBorderColor: FColor.primaryText,
                    defaultFieldBackgroundColor: FColor.white,
                    activeFieldBackgroundColor: FColor.white,
                    filledFieldBackgroundColor: Colors.green,
                    filledFieldBorderColor: Colors.green,
                  ),
                ),
                const Gap(14),
                FoodieButton(
                  onTap: onTap,
                  btnText: 'NEXT',
                ),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive any code ?",
                      style:
                          TextStyle(color: FColor.secondaryText, fontSize: 16),
                    ),
                    const Gap(5),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Click Here',
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
        ],
      ),
    );
  }
}
