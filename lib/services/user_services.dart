import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodie/utils/constraints/image_assets.dart';

class UserServices with ChangeNotifier {
  //getters
  List<CreditCardWidget> get userCards => _userCards;

  final List<CreditCardWidget> _userCards = [
    CreditCardWidget(
      padding: 5,
      cardNumber: '4242334834043625',
      expiryDate: '05/29',
      cardHolderName: 'Mushfiq Rahaman',
      cvvCode: '123',
      showBackView: false,
      onCreditCardWidgetChange: (value) {},
      bankName: 'Bangladesh Bank',
      backgroundImage: splashBg,
      isSwipeGestureEnabled: false,
      chipColor: Colors.amberAccent,
      cardBgColor: Colors.grey.shade400,
    ),
    CreditCardWidget(
      padding: 5,
      cardNumber: '3792 4307 0685 648',
      expiryDate: '05/39',
      cardHolderName: 'Mushfiq Rahaman',
      cvvCode: '123',
      showBackView: false,
      onCreditCardWidgetChange: (value) {},
      bankName: 'Dhaka Bank',
      backgroundImage: splashBg,
      isSwipeGestureEnabled: false,
      chipColor: Colors.amberAccent,
      cardBgColor: Colors.lightBlue.shade100,
    ),
  ];

  void addNewCard(CreditCardWidget creditCardWidget) {
    _userCards.add(creditCardWidget);
    notifyListeners();
  }
}
