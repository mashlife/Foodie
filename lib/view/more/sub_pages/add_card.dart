import 'package:flutter/material.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';

//create a model to credit cards with the following properties:
//bool isDeletable
//CreditCardWidget
//TODO: add provider amd remove stateful widget

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final cardNumber = TextEditingController();
  final expiryMonth = TextEditingController();
  final expiryYear = TextEditingController();
  final cvvCode = TextEditingController();
  final holderName = TextEditingController();

  bool isDeletable = false;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Credit/Debit Card",
                  style: TextStyle(
                    color: FColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print("Cancelling add new card");
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 3,
            ),
            const Gap(10),
            FoodieTextfield(
              controller: cardNumber,
              hintText: 'Card Number',
            ),
            const Gap(10),
            Row(
              children: [
                Text(
                  'Expiry',
                  style: TextStyle(
                      color: FColor.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  width: 70,
                  child: FoodieTextfield(
                    controller: expiryMonth,
                    hintText: 'MM',
                  ),
                ),
                const Gap(10),
                SizedBox(
                  width: 70,
                  child: FoodieTextfield(
                    controller: expiryYear,
                    hintText: 'YY',
                  ),
                ),
              ],
            ),
            const Gap(10),
            FoodieTextfield(
              controller: cvvCode,
              hintText: 'Security Code',
            ),
            const Gap(10),
            FoodieTextfield(
              controller: holderName,
              hintText: 'Name on Card',
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You can remove this card at anytime ',
                  style: TextStyle(
                    color: FColor.secondaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: isDeletable,
                  activeColor: FColor.highlight,
                  onChanged: ((value) {
                    setState(() {
                      isDeletable = value;
                    });
                  }),
                ),
              ],
            ),
            const Gap(25),
            RoundedTextIconButton(
              text: 'Add Card',
              onTap: () {
                print('Adding Card');
                Navigator.pop(context);
              },
              icon: btnAdd,
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
