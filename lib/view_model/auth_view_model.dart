import 'dart:developer';

import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/service/firestore_user.dart';
import 'package:e_commerce_app/utils/local_storage_data.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/control_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? email, password, name;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  final LocalStorageData _localStorageData = Get.find();

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
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential googleCredential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    signInWithCredentialAndSaveUser(googleCredential);
  }

  void facebookSignMethod() async {
    final FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = result.accessToken?.token;
    if (result.status == FacebookLoginStatus.success) {
      final faceCredentials = FacebookAuthProvider.credential(accessToken!);
      await signInWithCredentialAndSaveUser(faceCredentials);
    }
  }

  Future<void> signInWithCredentialAndSaveUser(
      AuthCredential faceCredentials) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(faceCredentials);
    saveUser(userCredential);
    Get.offAll(ControlScreen());
  }

  void signInWithEmailAndPassword() async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      var userData = await FireStoreUser().getCurrentUser(userCredential.user!.uid);
      setUser(UserModel.fromJson(userData.data()  as Map<String, dynamic>));

      Get.offAll(ControlScreen());
    } catch (e) {
      _handleSignInError(e);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        await saveUser(user);
        Get.offAll(ControlScreen());
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
    var userModel = UserModel(
      userId: user.user!.uid,
      email: email!,
      name: name ?? user.user?.displayName,
    );
    await FireStoreUser().addUserToFileStore(
      userModel,
    );
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    _localStorageData.setUser(userModel);
  }

  void _handleSignInError(dynamic error) {
    String errorMessage = _getErrorMessage(error);

    Get.snackbar(
      "Error Login Account",
      errorMessage,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'The email address is not registered.';
        case 'wrong-password':
          return 'Invalid password. Please try again.';
        default:
          return 'An error occurred during sign-in. Please try again later.';
      }
    } else {
      log("Signing with email and password has failed: $error");
      return 'An unexpected error occurred. Please try again later.';
    }
  }
}
