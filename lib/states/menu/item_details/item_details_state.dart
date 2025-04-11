import 'package:foodie/services/resturant_service.dart';

class ItemDetailsState extends ResturantServices {
  //getters
  int get itemCount => _itemCount;

  int _itemCount = 1;

  void increaseItemCount() {
    _itemCount += 1;
    notifyListeners();
  }

  void decreaseItemCount() {
    if (_itemCount > 1) {
      _itemCount -= 1;
      notifyListeners();
    }
  }
}
