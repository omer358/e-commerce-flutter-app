import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFileStore(UserModel userModel) async {
    log("add user to FileStore ${userModel.name}");
    return await _userCollectionRef.doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async{
    return await _userCollectionRef.doc(uid).get();
  }
}
