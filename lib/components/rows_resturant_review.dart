import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

class ResturantReviewRow extends StatelessWidget {
  const ResturantReviewRow({
    super.key,
    required this.rate,
  });

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ratingStar,
          height: 13,
          width: 10,
        ),
        const Gap(3),
        Text(
          rate,
          style: TextStyle(
            color: FColor.highlight,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ResturantReviewsWithReviewersRow extends StatelessWidget {
  const ResturantReviewsWithReviewersRow({
    super.key,
    required this.rate,
    required this.rating,
  });

  final String rate;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ratingStar,
          height: 13,
          width: 10,
        ),
        const Gap(3),
        Text(
          rate,
          style: TextStyle(
            color: FColor.highlight,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Gap(5),
        Text(
          '($rating)',
          style: TextStyle(
            color: FColor.secondaryText,
            fontWeight: FontWeight.w300,
            fontSize: 11,
          ),
        )
      ],
    );
  }
}

class ResturantLocationRow extends StatelessWidget {
  const ResturantLocationRow({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_rounded,
          color: FColor.primary,
          size: 20,
        ),
        const Gap(3),
        Text(
          location,
          textAlign: TextAlign.left,
          maxLines: 2,
          style: TextStyle(
            color: FColor.secondaryText,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
