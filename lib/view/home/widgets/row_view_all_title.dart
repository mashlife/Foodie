import 'package:flutter/material.dart';
import 'package:foodie/utils/theme/color_ext.dart';

class ViewAllTitleRow extends StatelessWidget {
  const ViewAllTitleRow({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: FColor.primaryText,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'View all',
              style: TextStyle(
                color: FColor.highlight,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
