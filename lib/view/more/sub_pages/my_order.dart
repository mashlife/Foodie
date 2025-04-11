import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_padding_widget.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/components/rows_resturant_review.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/checkout/checkout_view.dart';
import 'package:foodie/view/home/widgets/row_resturant_food_type.dart';
import 'package:gap/gap.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  List orderArr = [
    {"name": "Beef Burger", "qty": "1", "price": 399.0},
    {"name": "Classic Burger", "qty": "1", "price": 299.0},
    {"name": "Cheese Chicken Burger", "qty": "1", "price": 289.0},
    {"name": "Chicken Legs Basket", "qty": "1", "price": 249.0},
    {"name": "French Fires Large", "qty": "1", "price": 120.0}
  ];

  @override
  Widget build(BuildContext context) {
    double foodPrice = orderArr.map((e) {
      return e['price'];
    }).reduce((value, element) {
      return value + element;
    });

    double deliveryCharge = 50;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodieHeaderWithoutCart(
                header: 'My Orders',
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Gap(10),
              FpHorizontal(
                verticalPadding: 10,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        shopImage,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const Gap(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'King Burgers',
                          style: TextStyle(
                            color: FColor.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Gap(3),
                        const ResturantReviewsWithReviewersRow(
                            rate: '4.9', rating: '124'),
                        const ResturantAndFoodTypeRow(
                            type: 'Burger', foodType: 'Western Food'),
                        const ResturantLocationRow(
                            location: 'Jorpukur, Joydebpur, Gazipur')
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(color: FColor.textField),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orderArr.length,
                  separatorBuilder: (context, index) => Divider(
                    color: FColor.primary.withOpacity(0.4),
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(color: FColor.textField),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            orderArr[index]['name'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'x${orderArr[index]['qty']}',
                            style: TextStyle(
                              color: FColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '৳${orderArr[index]['price']}',
                            style: TextStyle(
                              color: FColor.secondaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(5),
              FpHorizontal(
                horizontalPadding: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Delivery Instruction',
                      style: TextStyle(
                        color: FColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: Text(
                        'Add Note',
                        style: TextStyle(
                          color: FColor.highlight,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: FColor.primary.withOpacity(0.2),
                thickness: 1,
              ),
              FpHorizontal(
                verticalPadding: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sub Total',
                      style: TextStyle(
                        color: FColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "৳${foodPrice.toString()}",
                      style: TextStyle(
                        color: FColor.highlight,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              FpHorizontal(
                verticalPadding: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Delivery Cost',
                      style: TextStyle(
                        color: FColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '৳$deliveryCharge',
                      style: TextStyle(
                        color: FColor.highlight,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: FColor.primary.withOpacity(0.2),
                thickness: 1,
              ),
              FpHorizontal(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: FColor.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '৳${foodPrice + deliveryCharge}',
                      style: TextStyle(
                        color: FColor.highlight,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              FpHorizontal(
                  child: RoundedContainerButton(
                      text: "Checkout",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CheckoutView()));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
