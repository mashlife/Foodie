import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_padding_widget.dart';
import 'package:foodie/components/foodie_rounded_button.dart';
import 'package:foodie/states/more/sub_pages/payment_info_state.dart';
import 'package:foodie/utils/constraints/image_assets.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:foodie/view/more/sub_pages/add_card.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({super.key});

  @override
  Widget build(BuildContext context) {
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
              FoodieHeaderWithCart(
                header: 'Payment Details',
                enableBackButton: true,
                onBackPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Gap(20),
              const FpHorizontal(
                child: Text(
                  'Customize your payment method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap(5),
              FpHorizontal(
                child: Divider(
                  color: Colors.grey.shade300,
                  thickness: 3,
                ),
              ),
              const Gap(10),
              Consumer<PaymentInfoState>(
                builder: (context, paymentState, child) => Container(
                  decoration: BoxDecoration(color: FColor.textField),
                  child: FpHorizontal(
                    verticalPadding: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          onTap: () {
                            paymentState.setPaymentMethod(PaymentMethod.cash);
                            if (paymentState.showCard == true) {
                              paymentState.toggleShowCard();
                            }
                          },
                          leading:
                              paymentState.paymentMethod == PaymentMethod.cash
                                  ? Icon(
                                      Icons.check,
                                      color: FColor.highlight,
                                    )
                                  : const Icon(null),
                          title: Text(
                            'Cash on Delivery',
                            style: TextStyle(
                                color: FColor.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            paymentState.setPaymentMethod(PaymentMethod.card);
                            if (paymentState.showCard == false) {
                              paymentState.toggleShowCard();
                            }
                          },
                          titleAlignment: ListTileTitleAlignment.center,
                          leading:
                              paymentState.paymentMethod == PaymentMethod.card
                                  ? Icon(
                                      Icons.check,
                                      color: FColor.highlight,
                                    )
                                  : const Icon(null),
                          title: Text(
                            'Credit/Debit Card',
                            style: TextStyle(
                              color: FColor.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: paymentState.showCard,
                          child: FpHorizontal(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const Gap(10),
                              itemCount: paymentState.userCards.length,
                              itemBuilder: ((context, index) {
                                final card = paymentState.userCards[index];
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade500,
                                            blurRadius: 10,
                                            spreadRadius: -5,
                                            offset: const Offset(-2, -1),
                                          ),
                                        ],
                                      ),
                                      child: CreditCardWidget(
                                        padding: card.padding,
                                        cardNumber: card.cardNumber,
                                        expiryDate: card.expiryDate,
                                        cardHolderName: card.cardHolderName,
                                        cvvCode: card.cvvCode,
                                        showBackView: card.showBackView,
                                        onCreditCardWidgetChange:
                                            card.onCreditCardWidgetChange,
                                        bankName: card.bankName,
                                        enableFloatingCard: false,
                                        backgroundImage: card.backgroundImage,
                                        isSwipeGestureEnabled:
                                            card.isSwipeGestureEnabled,
                                        chipColor: card.chipColor,
                                        cardBgColor: card.cardBgColor,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 20,
                                      child: GestureDetector(
                                        onTap: () {
                                          print('deleting card');
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: FColor.white,
                                            border: Border.all(
                                              color: FColor.primary,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Delete Card",
                                            style: TextStyle(
                                              color: FColor.secondaryText,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(20),
              FpHorizontal(
                child: RoundedTextIconButton(
                  text: 'Add another Credit/Debit Card',
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const AddCardView());
                  },
                  icon: btnAdd,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
