import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/utils/constraints/image_assets.dart';

class OnBoardingState with ChangeNotifier {
  int _selectedPage = 0;

  //getters
  int get selectedPage => _selectedPage;

  PageController pageController = PageController(initialPage: 0);
  List onBoardingPages = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
      "image": onBoarding1,
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office wherever you are",
      "image": onBoarding2,
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real time tracking of your food on the app once you placed the order",
      "image": onBoarding3,
      "lastPage": true,
    }
  ];

  OnBoardingState() {
    pageController.addListener(() {
      _selectedPage = pageController.page?.floor() ?? 0;
    });
    notifyListeners();
  }

  void changeSelectedPage(int currentPage) {
    _selectedPage = currentPage;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
