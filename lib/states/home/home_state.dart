import 'package:flutter/material.dart';
import 'package:foodie/models/individual_resturant.dart';
import 'package:foodie/utils/constraints/image_assets.dart';

class HomeState with ChangeNotifier {
  //Controllers
  TextEditingController searchFoodController = TextEditingController();

  //getters
  List get category => _catagory;
  List<IndividualResturantModel> get popularResturants => _popularResturants;
  List<IndividualResturantModel> get mostPopularResturants =>
      _mostPopularResturants;
  List<IndividualResturantModel> get recent => _recent;

  final List _catagory = [
    {"image": catOffer, "name": "Offers"},
    {"image": catBd, "name": "Bangladeshi"},
    {"image": catIndian, "name": "Indian"},
    {"image": catItalian, "name": "Italian"},
    {"image": catSriLan, "name": "Sri Lankan"},
  ];

  final List<IndividualResturantModel> _popularResturants = [
    IndividualResturantModel(
      image: popularRes1,
      name: 'Rustic Lounge',
      rate: '4.9',
      rating: '124',
      type: 'Resturant',
      foodType: 'Fast Food',
    ),
    IndividualResturantModel(
      image: popularRes2,
      name: 'Full Stop Lounge',
      rate: '4.5',
      rating: '250',
      type: 'Fine Dining',
      foodType: 'Western Food',
    ),
    IndividualResturantModel(
      image: popularRes3,
      name: 'Café de Noir',
      rate: '4.7',
      rating: '103',
      type: 'Café',
      foodType: 'Western Food',
    )
  ];

  final List<IndividualResturantModel> _mostPopularResturants = [
    IndividualResturantModel(
      image: mostPopularRes1,
      name: 'Café De Bambaa',
      rate: '4.9',
      rating: '454',
      type: 'Café',
      foodType: 'Western Food',
    ),
    IndividualResturantModel(
      image: mostPopularRes2,
      name: 'Burger by Bella',
      rate: '4.5',
      rating: '500+',
      type: 'Café',
      foodType: 'Western Food',
    ),
  ];

  final List<IndividualResturantModel> _recent = [
    IndividualResturantModel(
      image: recentRes1,
      name: 'Mulberry Pizza by Josh',
      rate: '4.3',
      rating: '185',
      type: 'Café',
      foodType: 'Western Food',
    ),
    IndividualResturantModel(
      image: recentRes2,
      name: 'Rustic Lounge',
      rate: '4.9',
      rating: '124',
      type: 'Café',
      foodType: 'Western Food',
    ),
    IndividualResturantModel(
      image: recentRes3,
      name: 'Barita',
      rate: '4.7',
      rating: '122',
      type: 'Café',
      foodType: 'Coffee',
    )
  ];
}
