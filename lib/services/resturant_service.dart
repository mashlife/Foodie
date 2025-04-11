import 'package:flutter/material.dart';
import 'package:foodie/models/food_item.dart';
import 'package:foodie/models/individual_resturant.dart';
import 'package:foodie/utils/constraints/image_assets.dart';

class ResturantServices with ChangeNotifier {
  //Controllers
  TextEditingController itemSearchController = TextEditingController();

  //getters
  List<FoodItemModel> get menuFoods => _menuFoods;
  List<FoodItemModel> get menuDesserts => _menuDesserts;
  List<FoodItemModel> get menuBeverages => _menuBeverages;
  List<IndividualResturantModel> get offerResturant => _offerResturant;

  final List<FoodItemModel> _menuFoods = [
    FoodItemModel(
      id: 1,
      name: "Tandoori Chicken Pizza",
      image: tandooriPizza,
      resturant: "Rustic Lounge",
      foodtype: "Dessert",
      foodrating: 4.3,
      sizes: ['8"', '12"'],
      prices: [299, 399],
    ),
  ];

  final List<FoodItemModel> _menuDesserts = [
    FoodItemModel(
      id: 21,
      name: "French Apple Pie",
      image: dessert1,
      resturant: "Rustic Lounge",
      foodtype: "Dessert",
      foodrating: 4.5,
      price: 299,
    ),
    FoodItemModel(
      id: 22,
      name: "Dark Chocolate Cake",
      image: dessert2,
      resturant: "Café de Noir",
      foodtype: "Dessert",
      foodrating: 4.7,
      price: 299,
    ),
    FoodItemModel(
      id: 23,
      name: "Street Shake",
      image: dessert3,
      resturant: "Barita",
      foodtype: "Dessert",
      foodrating: 4.7,
      ingredients: ["Strawberry", "Blueberry", "Cherry"],
      price: 299,
    ),
    FoodItemModel(
      id: 24,
      name: "Fudgy Chewy Brownies",
      image: dessert4,
      resturant: "Mulberry Pizza by Josh",
      foodtype: "Dessert",
      foodrating: 4.3,
      price: 299,
    ),
  ];

  final List<FoodItemModel> _menuBeverages = [
    FoodItemModel(
      id: 31,
      name: "Coco Mocha",
      image: beverage1,
      resturant: "Mulberry Pizza by Josh",
      foodtype: "Beverages",
      foodrating: 4.3,
      sizes: ["Small", "Big"],
      price: 299,
    ),
    FoodItemModel(
      id: 32,
      name: "Lemon Mint",
      image: beverage2,
      resturant: "Rustic Lounge",
      foodtype: "Beverages",
      foodrating: 3.8,
      price: 299,
    ),
    FoodItemModel(
      id: 33,
      name: "Virgin Mojito",
      image: beverage3,
      resturant: "Café de Noir",
      foodtype: "Beverages",
      foodrating: 4.7,
      price: 299,
    ),
  ];

  final List<IndividualResturantModel> _offerResturant = [
    IndividualResturantModel(
      image: offerResturant1,
      name: 'Café de Noires',
      rate: '4.9',
      rating: '124',
      type: 'Café',
      foodType: 'Western Food',
    ),
    IndividualResturantModel(
      image: offerResturant2,
      name: 'Isso',
      rate: '4.9',
      rating: '124',
      type: 'Café',
      foodType: 'Western Food',
    ),
    IndividualResturantModel(
      image: offerResturant3,
      name: 'Cafe Beans',
      rate: '4.9',
      rating: '124',
      type: 'Café',
      foodType: 'Western Food',
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    itemSearchController.dispose();
  }
}
