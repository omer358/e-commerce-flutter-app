import 'dart:developer';

import 'package:e_commerce_app/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _currentStep = 0;
  late String street1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey();

  get currentStep => _currentStep;

  void onStepTapped(int newIndex) {
    _currentStep = newIndex;
    update();
  }

  void nextStep() {
    const int maxStep = 2;

    if (_currentStep == 1) {
      // Check if it's the step with the form
      if (formState.currentState!.validate()) {
        _currentStep += 1;
      }
    } else if (_currentStep < maxStep) {
      _currentStep += 1;
    } else {
      onMaxStepReached();
      log("finish!");
    }

    update();
  }

  void previousStep() {
    if (_currentStep != 0) {
      _currentStep -= 1;
    }
    update();
  }

  void onMaxStepReached() {
    Get.off(() => const HomeScreen());
  }
}
