import 'package:e_commerce_app/utils/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_model.dart';

class ProfileViewModel extends GetxController {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  LocalStorageData localStorageData = Get.find<LocalStorageData>();

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    localStorageData.getUser.then((value) {
      _userModel = value!;
      update();
    });

  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
