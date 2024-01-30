import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final Function() onPressed;
  final String imageName;
  final String text;

  const CustomButtonSocial({
    super.key,
    required this.onPressed,
    required this.imageName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        child: Row(
          children: [
            Image.asset(
              imageName,
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(
              width: 90,
            ),
             CustomText(
              text: text,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
