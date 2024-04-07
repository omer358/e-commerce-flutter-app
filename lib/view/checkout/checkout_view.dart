import 'package:e_commerce_app/view/checkout/add_address_widget.dart';
import 'package:e_commerce_app/view/checkout/delivery_time_widget.dart';
import 'package:e_commerce_app/view/checkout/summary_widget.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view_model/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../constants.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: GetBuilder<CheckoutViewModel>(builder: (controller) {
        return Stepper(
          type: StepperType.horizontal,
          currentStep: controller.currentStep,
          steps: [
            Step(
              title: const Text("Deliver"),
              content: const DeliveryTime(),
              isActive: controller.currentStep == 0,
            ),
            Step(
              title: const Text("Address"),
              content: const AddAddress(),
              isActive: controller.currentStep == 1,
            ),
            Step(
              title: const Text("Summary"),
              content: const SummaryWidget(),
              isActive: controller.currentStep == 2,
            ),
          ],
          onStepTapped: (int newIndex) {
            controller.onStepTapped(newIndex);
          },
          onStepContinue: () {
            controller.nextStep();
          },
          onStepCancel: () {
            controller.previousStep();
          },
          connectorThickness: 2.0,
          connectorColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return states.contains(MaterialState.disabled)
                ? Colors.grey
                : primaryColor;
          }),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                CustomButton(
                    text: "Next", onPressed: () => controller.nextStep()),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  child: Text("Back"),
                  onPressed: () => controller.previousStep(),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
