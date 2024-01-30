import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)))),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
