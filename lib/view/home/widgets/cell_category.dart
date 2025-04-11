import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoryCellHome extends StatelessWidget {
  const CategoryCellHome({
    super.key,
    required this.singleCategory,
  });

  final dynamic singleCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              singleCategory["image"],
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(5),
          Text(
            singleCategory["name"],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
