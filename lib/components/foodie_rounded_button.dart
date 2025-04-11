import 'package:flutter/material.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = Colors.black12,
  });

  final IconData icon;
  final void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon),
      ),
    );
  }
}

class RoundedImageButton extends StatelessWidget {
  const RoundedImageButton({
    super.key,
    required this.imageAsset,
    required this.onTap,
    this.color = Colors.black12,
  });

  final String imageAsset;
  final void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(imageAsset)),
    );
  }
}

class RoundedTextButton extends StatelessWidget {
  const RoundedTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize = 16,
  });

  final String text;
  final void Function() onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: FColor.primary, borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: TextStyle(
            color: FColor.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class RoundedContainerButton extends StatelessWidget {
  const RoundedContainerButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize = 16,
  });

  final String text;
  final double fontSize;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: FColor.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: FColor.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class RoundedOutlinedButton extends StatelessWidget {
  const RoundedOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize = 16,
    this.height = 56,
  });

  final String text;
  final double fontSize;
  final double height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: FColor.white,
          border: Border.all(color: FColor.primary, width: 1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: FColor.primary,
              fontSize: fontSize,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class RoundedTextIconButton extends StatelessWidget {
  const RoundedTextIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String text;
  final String icon;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: FColor.primary,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            const Gap(8),
            Text(
              text,
              style: TextStyle(
                  color: FColor.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
