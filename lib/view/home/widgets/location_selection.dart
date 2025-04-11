import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/checkout/change_address.dart';
import 'package:gap/gap.dart';

class LocationHome extends StatelessWidget {
  const LocationHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivering to",
            style: TextStyle(color: FColor.secondaryText, fontSize: 11),
          ),
          const Gap(3),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const ChangeAddressView())));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Current Location",
                  style: TextStyle(
                      color: FColor.secondaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const Gap(25),
                Image.asset(
                  dropDowm,
                  width: 12,
                  height: 12,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
