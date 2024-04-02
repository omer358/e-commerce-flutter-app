import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/home_screen.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  Widget currentScreen = const HomeScreen();

  ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (controller.user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(builder: (controller) {
              return Scaffold(
                bottomNavigationBar: bottomNavigationBar(),
                body: controller.currentScreen,
              );
            });
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Explore",
                  style: TextStyle(color: primaryColor),
                ),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  "assets/images/Icon_Explore.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Cart",
                  style: TextStyle(color: primaryColor),
                ),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  "assets/images/Icon_Cart.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Profile",
                  style: TextStyle(color: primaryColor),
                ),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Image.asset(
                  "assets/images/Icon_User.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
        );
      },
    );
  }
}
