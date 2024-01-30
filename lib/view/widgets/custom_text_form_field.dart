import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function(String?) onSave;

  final String? Function(String?) onValidate;

  const CustomTextFormField({
    super.key,
    required this.text,
    required this.hint,
    required this.onSave,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            validator: onValidate,
            decoration:  InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
