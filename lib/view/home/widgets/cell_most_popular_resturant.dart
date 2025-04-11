import 'package:flutter/material.dart';
import 'package:foodie/models/individual_resturant.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/home/widgets/row_resturant_food_type.dart';
import 'package:foodie/components/rows_resturant_review.dart';
import 'package:gap/gap.dart';

class MostPopularCellHome extends StatelessWidget {
  const MostPopularCellHome({
    super.key,
    required this.indMostPopularResturant,
  });

  final IndividualResturantModel indMostPopularResturant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  indMostPopularResturant.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: ResturantReviewRow(rate: indMostPopularResturant.rate),
                ),
              )
            ],
          ),
        ),
        const Gap(8),
        Text(
          indMostPopularResturant.name,
          style: TextStyle(
            color: FColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        ResturantAndFoodTypeRow(
          type: indMostPopularResturant.type,
          foodType: indMostPopularResturant.foodType,
        )
      ],
    );
  }
}
