import 'package:flutter/material.dart';
import 'package:foodie/models/individual_resturant.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/home/widgets/row_resturant_food_type.dart';
import 'package:foodie/components/rows_resturant_review.dart';

class PopularResturantCellHome extends StatelessWidget {
  const PopularResturantCellHome({
    super.key,
    required this.indPopularResturant,
  });

  final IndividualResturantModel indPopularResturant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            indPopularResturant.image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    indPopularResturant.name,
                    style: TextStyle(
                      color: FColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ResturantReviewsWithReviewersRow(
                    rate: indPopularResturant.rate,
                    rating: indPopularResturant.rating,
                  ),
                ],
              ),
              ResturantAndFoodTypeRow(
                  type: indPopularResturant.type,
                  foodType: indPopularResturant.foodType),
            ],
          ),
        )
      ],
    );
  }
}
