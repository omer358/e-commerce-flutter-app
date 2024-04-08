import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(builder: (controller) {
      return Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 280,
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
                itemCount: controller.cartProductModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      child: Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 180,
                              width: 150,
                              child: Image.network(
                                controller.cartProductModel[index].image,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.cartProductModel[index].name,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                            CustomText(
                              alignment: Alignment.bottomLeft,
                              text:
                                  "\$ ${controller.cartProductModel[index].price}",
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ), separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 20,)
            ),
          )
        ],
      );
    });
  }
}
