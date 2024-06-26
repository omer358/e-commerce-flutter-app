import 'package:e_commerce_app/utils/extensions.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String productId, name, image, description, price, size;
  final Color color;

  ProductModel(
      {required this.productId,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.color,
      required this.size});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      color: HexColor.fromHex(json['color']),
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'size': size,
      'color': color,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "($productId,$name, $image, $description, $price, $size, $color)";
  }
}
