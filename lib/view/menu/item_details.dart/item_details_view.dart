import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/models/food_item.dart';
import 'package:foodie/states/menu/item_details/item_details_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.item});

  final FoodItemModel item;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            item.image,
            height: size.height * 0.41,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.topCenter,
            height: size.height * 0.4,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.transparent,
                  FColor.primary.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: FoodieHeaderWithCart(
              color: FColor.white,
              noHeader: true,
              enableBackButton: true,
              onBackPressed: () {
                print('back pressed');
              },
            ),
          ),
          Consumer<ItemDetailsState>(
            builder: (context, itemDetailsState, child) =>
                SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.35),
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: FColor.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black54,
                            blurRadius: 7,
                            offset: Offset(0, -2),
                          ),
                          BoxShadow(
                              color: FColor.highlight.withOpacity(0.5),
                              blurRadius: 5,
                              offset: const Offset(0, -3)),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RatingBar(
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemPadding: EdgeInsets.zero,
                                  initialRating:
                                      double.parse(item.foodrating.toString()),
                                  ratingWidget: RatingWidget(
                                    full: Icon(
                                      Icons.star_rounded,
                                      color: FColor.highlight,
                                    ),
                                    half: Icon(
                                      Icons.star_half_rounded,
                                      color: FColor.highlight,
                                    ),
                                    empty: const Icon(
                                      Icons.star_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  itemSize: 25,
                                  onRatingUpdate: (double value) {},
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "${item.foodrating} Star Ratings",
                                    style: TextStyle(
                                      color: FColor.highlight,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            item.price == null && item.prices!.isNotEmpty
                                ? Text(
                                    "BDT. ${item.prices![0]}",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : Text(
                                    "BDT. ${item.price}",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                          ],
                        ),
                        const Gap(15),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.',
                          style: TextStyle(color: FColor.secondaryText),
                        ),
                        const Gap(10),
                        Divider(
                          thickness: 2,
                          color: FColor.textField,
                        ),
                        const Gap(10),
                        item.sizes != null || item.ingredients != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Customize your Order',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  item.sizes != null && item.sizes!.isNotEmpty
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(19),
                                              bottomRight: Radius.circular(3),
                                            ),
                                            color: FColor.textField
                                                .withOpacity(0.8),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: item.sizes!
                                                  .map((itemSize) =>
                                                      DropdownMenuItem(
                                                        value: itemSize,
                                                        child: Text(
                                                          itemSize,
                                                          style: TextStyle(
                                                            color: FColor
                                                                .primaryText,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              onChanged: (val) {},
                                              hint: const Text('Choose Size'),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              isExpanded: true,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  const Gap(5),
                                  item.ingredients != null &&
                                          item.ingredients!.isNotEmpty
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(19),
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(3),
                                            ),
                                            color: FColor.textField
                                                .withOpacity(0.8),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: item.ingredients!
                                                  .map((itemSize) =>
                                                      DropdownMenuItem(
                                                        value: itemSize,
                                                        child: Text(
                                                          itemSize,
                                                          style: TextStyle(
                                                            color: FColor
                                                                .primaryText,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              onChanged: (val) {},
                                              hint: const Text(
                                                  'Choose Ingridients'),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              isExpanded: true,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              )
                            : const SizedBox.shrink(),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total items',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        itemDetailsState.decreaseItemCount(),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: FColor.primary.withOpacity(0.8),
                                      ),
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          color: FColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color:
                                              FColor.primary.withOpacity(0.25)),
                                      color: FColor.textField.withOpacity(0.8),
                                    ),
                                    child: SizedBox(
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          itemDetailsState.itemCount.toString(),
                                          style: TextStyle(
                                            color: FColor.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(5),
                                  InkWell(
                                    onTap: () =>
                                        itemDetailsState.increaseItemCount(),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: FColor.primary.withOpacity(0.8),
                                      ),
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          color: FColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Gap(20),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              width: size.width * 0.3,
                              height: 150,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: FColor.primary.withOpacity(0.7),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(5),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5,
                                      offset: Offset(-2, 2)),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Container(
                                  height: 90,
                                  width: size.width * 0.75,
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 15),
                                  decoration: BoxDecoration(
                                    color: FColor.white,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      const BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 7,
                                        offset: Offset(0, -2),
                                      ),
                                      BoxShadow(
                                          color:
                                              FColor.highlight.withOpacity(0.5),
                                          blurRadius: 5,
                                          offset: const Offset(-2, 2)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Price',
                                          style: TextStyle(
                                            color: FColor.secondaryText,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const Gap(5),
                                        Text(
                                          "299 BDT",
                                          style: TextStyle(
                                            color: FColor.primaryText,
                                            fontSize: 23,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: FColor.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 7,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    shoppingCart,
                                    color: FColor.primary,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.33,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FColor.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: FColor.highlight.withOpacity(0.5),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          //TODO: remove go back functionality & complete the favorite icon code
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: FColor.highlight,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
