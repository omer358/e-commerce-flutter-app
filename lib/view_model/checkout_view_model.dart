import 'dart:developer';

import 'package:e_commerce_app/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _currentStep = 0;
  late String street1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey();

  List<bool> stepCompleted = [false, false, false]; // Tracks completion status of each step
  List<bool> stepEditing = [true, false, false]; // Tracks editing status of each step, set first step to true initially


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
        stepCompleted[_currentStep] = true; // Mark the current step as completed
        stepEditing[_currentStep] = false; // Turn off editing for the current step
        _currentStep += 1;
      }
    } else if (_currentStep < maxStep) {
      stepCompleted[_currentStep] = true; // Mark the current step as completed
      stepEditing[_currentStep] = false; // Turn off editing for the current step
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
      stepEditing[_currentStep] = true; // Allow editing for the previous step
    }
    update();
  }

  void onMaxStepReached() {
    Get.off(() => const HomeScreen());
  }
}
