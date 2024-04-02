import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              controller.signOut();
              Get.offAll(LoginScreen());
            },
            child: const Text("SignOut"),
          ),
        ),
      );
    });
  }
}
