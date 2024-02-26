import 'package:e_commerce_app/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/cart_screen.dart';
import '../view/profile_screen.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedIndex) {
    _navigatorValue = selectedIndex;
    switch (selectedIndex) {
      case 0:
        _currentScreen =  HomeScreen();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = ProfileScreen();
        break;
    }
    update();
  }
}
