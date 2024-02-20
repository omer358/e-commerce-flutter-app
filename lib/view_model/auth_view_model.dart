import 'dart:developer';

import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/service/firestore_user.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late String email, password, name;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_firebaseAuth.userChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential).then(
          (user) {
            saveUser(user);
            Get.offAll(HomeScreen());
          },
        );

  }

  void facebookSignMethod() async {
    final FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = result.accessToken?.token;
    if (result.status == FacebookLoginStatus.success) {
      final faceCredentials = FacebookAuthProvider.credential(accessToken!);
      await _firebaseAuth.signInWithCredential(faceCredentials).then((user) {
        saveUser(user);
        Get.offAll(HomeScreen());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(HomeScreen());
    } catch (e) {
      log("Signing with google has failed: $e");
      Get.snackbar("Error Login Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await saveUser(user);
        Get.offAll(HomeScreen());
      });
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error Creating Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    _firebaseAuth.signOut();
    Get.offAll(() => LoginScreen());
  }

  Future<void> saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFileStore(UserModel(
        userId: user.user!.uid,
        email: email,
        name: name ?? user.user?.displayName,
    ),
    );
  }
}
