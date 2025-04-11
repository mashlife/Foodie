import 'package:flutter/material.dart';
import 'package:foodie/utils/theme/food_theme.dart';


class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = FoodTheme.lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == FoodTheme.darkMode;

  String get themeName =>
      _themeData == FoodTheme.lightMode ? "Light Mode" : "Dark Mode";

  setThemedata(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == FoodTheme.lightMode) {
      _themeData = FoodTheme.darkMode;
    } else {
      _themeData = FoodTheme.lightMode;
    }
    notifyListeners();
  }
}
