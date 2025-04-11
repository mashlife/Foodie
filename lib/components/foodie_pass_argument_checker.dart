import 'package:flutter/material.dart';

class SinglePassArgumentChecker extends StatelessWidget {
  const SinglePassArgumentChecker({
    super.key,
    required this.argument,
    required this.text,
  });
  final String text;
  final bool argument;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: argument
              ? Colors.green
              : Colors.blueGrey),
    );
  }
}
