import 'dart:developer';

import 'package:e_commerce_app/utils/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_model.dart';

class ProfileViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  LocalStorageData localStorageData = Get.find<LocalStorageData>();

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    _loading.value = true;
    localStorageData.getUser.then((value) {
      _userModel = value!;
      _loading.value = false;
      log("${_loading.value}");
      log("${_userModel?.name}");
      update();
    });

  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
