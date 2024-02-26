import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final _categoryCollectionRef =
  FirebaseFirestore.instance.collection("Categories");

  final _productsCollectionRef =
  FirebaseFirestore.instance.collection("Products");

  Future<List<QueryDocumentSnapshot>> getCategory() async{
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async{
    var products = await _productsCollectionRef.get();
    return products.docs;
  }
}