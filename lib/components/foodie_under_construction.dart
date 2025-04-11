import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:gap/gap.dart';

class FoodieUnderCons extends StatelessWidget {
  const FoodieUnderCons({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            logo,
            height: size.height * 0.13,
          ),
          const Gap(20),
          const Text(
            'This screen is being developed',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4),
          ),
        ],
      ),
    );
  }
}
