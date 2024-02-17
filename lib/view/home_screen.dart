import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<AuthViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions:  [
          IconButton(onPressed: (){
            Get.find<AuthViewModel>().signOut();
          }, icon: const Icon(Icons.logout)),
        ],
      ),
      body:  Center(
        child: Text("Welcome!\n ${controller.user}"),
      ),
    );
  }
}
