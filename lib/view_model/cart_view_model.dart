import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/service/database/cart_database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;


CartViewModel(){
  getAllProducts();
}

  getAllProducts() async {
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.fetchProducts();
    _loading.value = false;
  }

  addProduct(CartProductModel cartProductModel) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }
}
