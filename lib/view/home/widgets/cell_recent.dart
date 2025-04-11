import 'package:flutter/material.dart';
import 'package:foodie/models/individual_resturant.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/home/widgets/row_resturant_food_type.dart';
import 'package:foodie/components/rows_resturant_review.dart';
import 'package:gap/gap.dart';

class RecentCellHome extends StatelessWidget {
  const RecentCellHome({
    super.key,
    required this.indRecent,
  });

  final IndividualResturantModel indRecent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              indRecent.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              indRecent.name,
              style: TextStyle(
                color: FColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            ResturantAndFoodTypeRow(
              type: indRecent.type,
              foodType: indRecent.foodType,
            ),
            ResturantReviewsWithReviewersRow(
              rate: indRecent.rate,
              rating: indRecent.rating,
            )
          ],
        )
      ],
    );
  }
}
