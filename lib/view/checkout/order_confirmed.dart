import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

//create a model to credit cards with the following properties:
//bool isDeletable
//CreditCardWidget
//TODO: add provider amd remove stateful widget

class OrderConfirmedView extends StatefulWidget {
  const OrderConfirmedView({super.key});

  @override
  State<OrderConfirmedView> createState() => _OrderConfirmedViewState();
}

class _OrderConfirmedViewState extends State<OrderConfirmedView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: FColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  print("Cancelling add new card");
                },
                icon: const Icon(Icons.close),
              ),
            ),
            const Gap(10),
            Image.asset(
              orderConfirmed,
              height: 250,
              width: 250,
              fit: BoxFit.contain,
            ),
            const Gap(10),
            Text(
              'Thank You ',
              style: TextStyle(
                color: FColor.primaryText,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'for your order ',
              style: TextStyle(
                color: FColor.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(20),
            Text(
              'Your Order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FColor.secondaryText,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Gap(30),
            RoundedContainerButton(
              text: 'Track My Order',
              onTap: () {
                print('Tracking order');
                Navigator.pop(context);
              },
            ),
            const Gap(5),
            TextButton(
              onPressed: () {
                print('go back to home');
              },
              child: Text(
                'Back To Home',
                style: TextStyle(
                  color: FColor.secondaryText,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
