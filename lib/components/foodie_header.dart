import 'package:flutter/material.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/more/sub_pages/my_order.dart';
import 'package:gap/gap.dart';

class FoodieHeaderWithCart extends StatelessWidget {
  const FoodieHeaderWithCart({
    super.key,
    this.header,
    this.enableBackButton = false,
    this.noHeader = false,
    this.onBackPressed,
    this.color = Colors.black,
  });

  final String? header;
  final bool enableBackButton;
  final bool noHeader;
  final VoidCallback? onBackPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: enableBackButton
          ? noHeader
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onBackPressed,
                      child: Image.asset(
                        btnBack,
                        height: 20,
                        width: 20,
                        color: color,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //go to cart
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        shoppingCart,
                        height: 20,
                        fit: BoxFit.cover,
                        color: color,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onBackPressed,
                      child: Image.asset(
                        btnBack,
                        height: 20,
                        width: 20,
                        color: color,
                      ),
                    ),
                    Text(
                      header!,
                      style: TextStyle(
                        color: FColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //go to cart
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        shoppingCart,
                        height: 20,
                        fit: BoxFit.cover,
                        color: color,
                      ),
                    ),
                  ],
                )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  header!,
                  style: TextStyle(
                    color: FColor.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //go to cart
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOrderView()));
                  },
                  icon: Image.asset(
                    shoppingCart,
                    height: 20,
                    fit: BoxFit.cover,
                    color: color,
                  ),
                ),
              ],
            ),
    );
  }
}

class FoodieHeaderWithoutCart extends StatelessWidget {
  const FoodieHeaderWithoutCart({
    super.key,
    this.header,
    this.onBackPressed,
    this.color = Colors.black,
  });

  final String? header;

  final VoidCallback? onBackPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onBackPressed,
              child: Image.asset(
                btnBack,
                height: 20,
                width: 20,
                color: color,
              ),
            ),
            const Gap(30),
            Text(
              header!,
              style: TextStyle(
                color: FColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ));
  }
}
