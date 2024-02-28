import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
                init: Get.find<CartViewModel>(),
                builder: (controller) {
                  return Container(
                    child: ListView.separated(
                        itemCount: controller.cartProductModel.length,
                        itemBuilder: (context, index) => SizedBox(
                            height: 140,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 140,
                                  child: Image.network(
                                    controller
                                        .cartProductModel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: controller
                                              .cartProductModel[index]
                                              .name,
                                          fontSize: 24),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text:
                                            "\$ ${controller.cartProductModel[index].price.toString()}",
                                        fontSize: 16,
                                        color: primaryColor,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 40,
                                        color: Colors.grey.shade200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const CustomText(
                                              text: "1",
                                              fontSize: 20,
                                              alignment: Alignment.center,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: const Icon(
                                                Icons.minimize,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                              height: 12,
                            )),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "TOTAL",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomText(
                      text: "\$2000",
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(text: "CHECKOUT", onPressed: () {})),
              ],
            ),
          )
        ],
      ),
    );
  }
}
