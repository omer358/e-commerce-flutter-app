import 'dart:developer';

import 'package:e_commerce_app/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  final List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;


  HomeViewModel() {
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        log(_categoryModel.length.toString());
        _loading.value = false;
      }
      update();
    });
  }
}
