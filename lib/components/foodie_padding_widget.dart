import 'package:flutter/material.dart';

class FpHorizontal extends StatelessWidget {
  const FpHorizontal({
    super.key,
    required this.child,
    this.verticalPadding = 0,
    this.horizontalPadding = 20,
  });

  final Widget child;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: child,
    );
  }
}
