import 'package:foodie/services/user_services.dart';

enum PaymentMethod { cash, card }

class PaymentInfoState extends UserServices {
  //getters
  bool get showCard => _showCard;
  PaymentMethod get paymentMethod => _paymentMethod;

  bool _showCard = false;
  PaymentMethod _paymentMethod = PaymentMethod.cash;

  PaymentInfoState() {
    if (_paymentMethod == PaymentMethod.card) {
      _showCard = true;
    } else if (_paymentMethod == PaymentMethod.cash) {
      _showCard = false;
    }
    notifyListeners();
  }

  void toggleShowCard() {
    _showCard = !_showCard;
    notifyListeners();
  }

  void setPaymentMethod(PaymentMethod payMethod) {
    if (_paymentMethod != payMethod) {
      _paymentMethod = payMethod;
      notifyListeners();
    }
  }
}
