import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        const CustomText(
          text: "Billing addres is the same as delivery address",
          fontSize: 20,
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTextFormField(
            text: "Street 1",
            hint: "21, Alex Davidson Avenue",
            onSave: (value) {},
            onValidate: (value) {}),
        const SizedBox(height: 40),
        CustomTextFormField(
            text: "Street 2",
            hint: "Opposite Omegarton, Vicent Quarters",
            onSave: (value) {},
            onValidate: (value) {}),
        const SizedBox(height: 40),
        Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(text: "State",
                      hint: "Khartoum",
                      onSave: (value) {},
                      onValidate: (string) {}),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomTextFormField(text: "Country",
                        hint: "Sudan",
                        onSave: (value){},
                        onValidate:(value){}),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
