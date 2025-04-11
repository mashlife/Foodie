import 'package:flutter/material.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

class ResturantAndFoodTypeRow extends StatelessWidget {
  const ResturantAndFoodTypeRow({
    super.key,
    required this.type,
    required this.foodType,
  });

  final String type;
  final String foodType;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(
            color: FColor.secondaryText,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Gap(10),
        Text(
          '⚈',
          style: TextStyle(color: FColor.primary, fontSize: 8),
        ),
        const Gap(10),
        Text(
          foodType,
          style: TextStyle(
            color: FColor.secondaryText,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}