import 'package:flutter/cupertino.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Summary",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}