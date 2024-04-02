import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<bool> setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value =
        await prefs.setString(cachedUserData, json.encode(userModel.toJson()));
    return value;
  }

  Future<UserModel?> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(cachedUserData);
    if (value != null) {
      return UserModel.fromJson(json.decode(value));
    } else {
      return null;
    }
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
