import 'package:e_commerce_app/utils/enums.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  DeliveryTime({super.key});

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.standard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        RadioListTile(
          title: CustomText(text: "Standard Delivery", fontSize: 24),
          subtitle: CustomText(
            text: "\nOrder will be Delivered between 3-5 business days",
            fontSize: 16,
          ),
          value: Delivery.standard,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery = value!;
            });
          },
        ),
        const SizedBox(height: 20,),
        RadioListTile(
          title: CustomText(text: "Next Day Delivery", fontSize: 24),
          subtitle: CustomText(
            text:
                "\nPlace your order before 6pm and your items will be delivered next day!",
            fontSize: 16,
          ),
          value: Delivery.nextDay,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery = value!;
            });
          },
        ),
        const SizedBox(height: 20,),
        RadioListTile(
          title: CustomText(text: "Nominated Delivery", fontSize: 24),
          subtitle: CustomText(
            text:
                "\nPick a particular  date from the calender  and your order will be delivered  on the selected date ",
            fontSize: 16,
          ),
          value: Delivery.nominated,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery = value!;
            });
          },
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
