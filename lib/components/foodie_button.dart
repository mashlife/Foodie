import 'package:flutter/material.dart';
import 'package:foodie/utils/theme/color_ext.dart';

enum ButtonType { bgColored, bgTransparent }

class FoodieButton extends StatelessWidget {
  const FoodieButton({
    super.key,
    required this.onTap,
    required this.btnText,
    this.type = ButtonType.bgColored,
  });

  final void Function()? onTap;
  final String btnText;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: size.width * 0.6,
        decoration: BoxDecoration(
          color: type == ButtonType.bgColored ? FColor.primary : FColor.white,
          border: type == ButtonType.bgColored
              ? null
              : Border.all(color: FColor.primary),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: type == ButtonType.bgColored
                ? FColor.fButtonText
                : FColor.primaryText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
