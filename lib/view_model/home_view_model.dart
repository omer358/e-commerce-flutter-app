import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_model.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  final List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;
  final _categoryCollectionRef =
      FirebaseFirestore.instance.collection("Categories");

  HomeViewModel() {
    getCategory();
  }

  getCategory() async {
    _loading.value = true;
    await _categoryCollectionRef.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
        log(_categoryModel.length.toString());
        _loading.value = false;
      }
      update();
    });
  }
}
