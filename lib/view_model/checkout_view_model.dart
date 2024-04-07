import 'dart:developer';

import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _currentStep = 0;

  get currentStep => _currentStep;

  void onStepTapped(int newIndex) {
    _currentStep = newIndex;
    update();
  }

  void nextStep() {
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
