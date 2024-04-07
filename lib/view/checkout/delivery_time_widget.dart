
import 'package:flutter/material.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Choose delivery time",
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
