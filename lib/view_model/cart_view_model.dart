import 'dart:developer';

import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/service/database/cart_database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.fetchProducts();

    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      log("total products price: ${_totalPrice.toString()}");
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    if (_cartProductModel.isEmpty) {
      log("the cartProductModel is empty!");
      await dbHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
    } else {
      log("the cartProductModel is NOT empty!");
      for (int i = 0; i < _cartProductModel.length; i++) {
        if (_cartProductModel[i].productId == cartProductModel.productId) {
          log("the product is already in the _cartProductModel");
          return;
        }
      }
      log("the product is not in the _cartProductModel and it's being add to the database");
      await dbHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
      _totalPrice +=
          (double.parse(cartProductModel.price) * cartProductModel.quantity);
    }
    update();
  }

  increaseQuantity(int index) {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) {
    _cartProductModel[index].quantity--;
    _totalPrice -= double.parse(_cartProductModel[index].price);
    if (_cartProductModel[index].quantity <= 0) {
      // Remove the product from the cart and from the database
      dbHelper.deleteProduct(_cartProductModel[index].productId);
      _cartProductModel.removeAt(index);
    } else {
      dbHelper.updateProduct(_cartProductModel[index]);
    }
    update();
  }
}
