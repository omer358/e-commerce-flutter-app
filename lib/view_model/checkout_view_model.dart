import 'dart:developer';

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
    log(_currentStep.toString());
    if (_currentStep < 2) {
      _currentStep += 1;
    } else {
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
}
