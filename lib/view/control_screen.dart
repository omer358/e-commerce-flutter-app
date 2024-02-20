import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/home_screen.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (controller.user != null)
          ? HomeScreen()
          : LoginScreen();
    });
  }
}
