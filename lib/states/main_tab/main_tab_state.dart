import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/view/home/home_view.dart';

class MainTabState with ChangeNotifier {
  int _selectedTab = 2;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget _selectedPageView = const HomeView();

  //getters
  int get selectedTab => _selectedTab;
  Widget get selectedPageView => _selectedPageView;

  void setSelectedTab(int tabIndex) {
    _selectedTab = tabIndex;
    notifyListeners();
  }

  void setPageView(Widget page) {
    _selectedPageView = page;
    notifyListeners();
  }
}
