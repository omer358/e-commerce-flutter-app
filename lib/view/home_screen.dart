import 'dart:developer';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detials_screen.dart';

class HomeScreen extends GetWidget<AuthViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find<HomeViewModel>(),
        builder: (logic) {
          return logic.loading.value
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 70, left: 20, right: 20),
                      child: Column(
                        children: [
                          _searchTextFormField(),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomText(text: "Categories", fontSize: 20),
                          const SizedBox(
                            height: 30,
                          ),
                          _listViewCategory(),
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "Products", fontSize: 20),
                              CustomText(
                                text: "See All",
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _listViewProducts(),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ))),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                    text: controller.categoryModel[index].name, fontSize: 14)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 20,
          ),
        ),
      );
    });
  }

  _listViewProducts() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return Container(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                log(controller.products[index].toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(model: controller.products[index]),
                  ),
                );
                // Get.to(() => DetailsScreen(
                //       model: controller.products[index],
                //     ));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 220,
                      child: Hero(
                        tag: "product-image-${controller.products[index].name}",
                        child: Image.network(
                          controller.products[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: controller.products[index].name,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.products[index].description,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "${controller.products[index].price} \$",
                      fontSize: 14,
                      color: primaryColor,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 20,
          ),
        ),
      );
    });
  }
}
