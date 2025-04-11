import 'package:flutter/material.dart';
import 'package:foodie/utils/constraints/image_assets.dart';

class MenuState with ChangeNotifier {
  //Controllers
  TextEditingController searchController = TextEditingController();

  //getters
  List get menu => _menu;

  final List _menu = [
    {
      "name": "Food",
      "image": menuFood,
      "item_count": "120",
    },
    {
      "name": "Beverages",
      "image": menuBeverage,
      "item_count": "220",
    },
    {
      "name": "Desserts",
      "image": menuDessert,
      "item_count": "135",
    },
    {
      "name": "Promotions",
      "image": menuPromo,
      "item_count": "20",
    },
  ];
}
