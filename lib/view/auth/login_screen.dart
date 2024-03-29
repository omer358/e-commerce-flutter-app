import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/auth/register_screen.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_button_social.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "Welcome", fontSize: 30),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "Sign Up",
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ),
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
                  onSave: (value) {
                    controller.email = value!;
                  },
                  onValidate: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "password",
                  hint: "*************",
                  onSave: (value) {
                    controller.password = value!;
                  },
                  onValidate: (value) {
                    if (value == null) {
                      print("PASSWORD ERROR");
                    }
                  },
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      controller.signInWithEmailAndPassword();
                    }
                  },
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
                const SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  onPressed: () {
                    Get.showSnackbar(const GetSnackBar(
                      title: "Not Supported",
                      message: "This feature isn't available yet!",
                    ));
                    // controller.facebookSignMethod();
                  },
                  imageName: "assets/images/facebook.png",
                  text: "Sign in with Facebook",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
