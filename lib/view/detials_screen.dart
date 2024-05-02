import 'dart:developer';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/cart_product_model.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel model;

  const DetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    log(model.toString());
    log("test");
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Hero(
                tag: "product-image-${model.name}",
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(text: model.name, fontSize: 26),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(text: "Size", fontSize: 16),
                                CustomText(text: model.size, fontSize: 16),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const CustomText(text: "Color", fontSize: 16),
                                Container(
                                  width: 30,
                                  height: 25,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    color: model.color,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomText(text: "Details", fontSize: 18),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model.description,
                        fontSize: 18,
                        height: 2.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: "PRICE",
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "\$${model.price}",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                      init: Get.find<CartViewModel>(),
                      builder: (controller) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          width: 180,
                          height: 100,
                          child: CustomButton(
                            text: "ADD",
                            onPressed: () {
                              controller.addProduct(
                                CartProductModel(
                                    productId: model.productId,
                                    name: model.name,
                                    image: model.image,
                                    price: model.price,
                                    quantity: 1),
                              );
                            },
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
