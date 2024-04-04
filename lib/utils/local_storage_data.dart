import 'dart:convert';
import 'dart:developer';

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
    log("UserModel being saved to the Shared Preferences: $userModel");
    var value =
        await prefs.setString(cachedUserData, json.encode(userModel.toJson()));
    log("The result of the saving the user to the shared preferences is $value");
    return value;
  }

  Future<UserModel?> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(cachedUserData);
    if (value != null) {
      log("the fetched value from the shared preferences: $value");
      return UserModel.fromJson(json.decode(value));
    } else {
      log("The fetched value from Shared Preferences is null!");
      return null;
    }
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
