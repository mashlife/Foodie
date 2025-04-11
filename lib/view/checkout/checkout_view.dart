import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_padding_widget.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/components/rows_resturant_review.dart';
import 'package:foodie/services/user_services.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/checkout/change_address.dart';
import 'package:foodie/view/checkout/order_confirmed.dart';
import 'package:foodie/view/home/widgets/row_resturant_food_type.dart';
import 'package:foodie/view/more/sub_pages/add_card.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  List orderArr = [
    {"name": "Beef Burger", "qty": "1", "price": 399.0},
    {"name": "Classic Burger", "qty": "1", "price": 299.0},
    {"name": "Cheese Chicken Burger", "qty": "1", "price": 289.0},
    {"name": "Chicken Legs Basket", "qty": "1", "price": 249.0},
    {"name": "French Fires Large", "qty": "1", "price": 120.0}
  ];

  List paymentArr = [
    {"name": "Cash on delivery", "icon": "media/images/cash.png"},
    {"name": "**** **** **** 2187", "icon": "media/images/visa_icon.png"},
    {"name": "test@gmail.com", "icon": "media/images/paypal.png"},
  ];

  int selectMethod = -1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double foodPrice = orderArr.map((e) {
      return e['price'];
    }).reduce((value, element) {
      return value + element;
    });

    double deliveryCharge = 50;
    double discount = 100;

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
                header: 'Checkout',
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Gap(10),
              FpHorizontal(
                child: Text(
                  'Delivery Address',
                  style: TextStyle(
                    color: FColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(5),
              FpHorizontal(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        '653 Nostrand Ave., Brooklyn, NY 11216',
                        style: TextStyle(
                          color: FColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const ChangeAddressView())));
                      },
                      child: Text(
                        'Change',
                        style: TextStyle(
                          color: FColor.highlight,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Divider(color: FColor.textField, thickness: 10),
              const Gap(10),
              FpHorizontal(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment method',
                      style: TextStyle(
                        color: FColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const AddCardView());
                      },
                      icon: Icon(
                        Icons.add_outlined,
                        color: FColor.highlight,
                        size: 16,
                        weight: 30,
                      ),
                      label: Text(
                        'Add Card',
                        style: TextStyle(
                          color: FColor.highlight,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FpHorizontal(
                verticalPadding: 8,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: paymentArr.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: FColor.textField,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: FColor.secondaryText.withOpacity(0.4),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectMethod = index;
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              paymentArr[index]['icon'],
                              width: 30,
                              height: 25,
                            ),
                            const Gap(10),
                            Text(paymentArr[index]['name']),
                            const Spacer(),
                            selectMethod == index
                                ? const Icon(Icons.radio_button_checked)
                                : const Icon(Icons.radio_button_off),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(color: FColor.textField, thickness: 10),
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
              FpHorizontal(
                verticalPadding: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                        color: FColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '- ৳$discount',
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
                      '৳${foodPrice + deliveryCharge - discount}',
                      style: TextStyle(
                        color: FColor.highlight,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Divider(color: FColor.textField, thickness: 10),
              const Gap(20),
              FpHorizontal(
                  child: RoundedContainerButton(
                      text: "CONFIRM ORDER",
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const OrderConfirmedView());
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
