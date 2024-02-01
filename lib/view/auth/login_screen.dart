import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_button_social.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 50,
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Welcome", fontSize: 30),
                CustomText(
                  text: "Sign Up",
                  fontSize: 18,
                  color: primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Sign in to continue ",
              fontSize: 15,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              text: "Email",
              hint: "example@gmail.com",
              onSave: (value) {},
              onValidate: (value) {},
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              text: "password",
              hint: "*************",
              onSave: (value) {},
              onValidate: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Forget password?",
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'LOGIN',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "-OR-",
              fontSize: 16,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButtonSocial(
              onPressed: () {
                controller.googleSignInMethod();
              },
              imageName: "assets/images/google.png",
              text: "Sign in with google",
            ),
            const SizedBox(height: 40,),
            CustomButtonSocial(
              onPressed: () {},
              imageName: "assets/images/facebook.png",
              text: "Sign in with Facebook",
            ),
          ],
        ),
      ),
    );
  }
}

