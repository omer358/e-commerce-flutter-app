import 'dart:developer';

import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  final List<CategoryModel> _categoryModel = [];
  final List<ProductModel> _products = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> get products => _products;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        log(_categoryModel.length.toString());
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _products.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}
