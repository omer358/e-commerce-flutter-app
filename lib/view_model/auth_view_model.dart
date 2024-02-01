import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
    final AuthCredential credential=  GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  void facebookSignMethod() async{
  final FacebookLoginResult result =  await _facebookLogin.logIn(customPermissions: ['email']);
  final accessToken = result.accessToken?.token;
  if(result.status == FacebookLoginStatus.success){
    final faceCredentials = FacebookAuthProvider.credential(accessToken!);
    await _firebaseAuth.signInWithCredential(faceCredentials);
  }
  }
}
