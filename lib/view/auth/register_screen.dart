import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

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
                const CustomText(text: "Sign Up", fontSize: 30),

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
                  text: "Full Name",
                  hint: "Foo Bar",
                  onSave: (value) {
                    controller.name = value!;
                  },
                  onValidate: (value) {
                    if(value == null){
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: "example@gmail.com",
                  onSave: (value) {
                    controller.email = value!;
                  },
                  onValidate: (value) {
                    if(value == null){
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
                    if(value == null){
                      print("PASSWORD ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'LOGIN',
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState?.save();
                      controller.createAccountWithEmailAndPassword();
                    }

                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
