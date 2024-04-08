import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _currentStep = 0;
  late String street1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey();

  FocusNode street1FocusMode = FocusNode();
  get currentStep => _currentStep;


  @override
  void dispose() {
    super.dispose();
    street1FocusMode.dispose();
  }

  void onStepTapped(int newIndex) {
    _currentStep = newIndex;
    update();
  }

  void nextStep() {
    if (_currentStep < 2) {
      if(_currentStep ==1){
        formState.currentState?.save();
        if(formState.currentState!.validate()){
          _currentStep +=1;
        }else{
          return;
        }
      }
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
