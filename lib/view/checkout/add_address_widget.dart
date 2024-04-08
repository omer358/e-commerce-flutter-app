import 'dart:developer';

import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/view_model/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(builder: (controller) {
      return Form(
        key: controller.formState,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const CustomText(
                text: "Billing address is the same as delivery address",
                fontSize: 20,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: "Street 1",
                hint: "21, Alex Davidson Avenue",
                onSave: (value) {
                  if (value != null) {
                    controller.street1 = value;
                  } else {
                    log("Street1 value is null!");
                  }
                },
                onValidate: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "This field  can't be empty!";
                    } else {
                      return null;
                    }
                  } else {
                    log("the value of validator is null");
                    return null;
                  }
                },
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                  text: "Street 2",
                  hint: "Opposite Omegarton, Vicent Quarters",
                  onSave: (value) {
                    if (value != null) {
                      controller.street2 = value;
                    } else {
                      log("Street1 value is null!");
                    }
                  },
                  onValidate: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return "This field  can't be empty!";
                      } else {
                        return null;
                      }
                    } else {
                      log("the value of validator is null");
                      return null;
                    }
                  }),
              const SizedBox(height: 40),
              CustomTextFormField(
                  text: "City",
                  hint: "Wad Madani",
                  onSave: (value) {
                    if (value != null) {
                      controller.street2 = value;
                    } else {
                      log("City value is null!");
                    }
                  },
                  onValidate: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return "This field  can't be empty!";
                      } else {
                        return null;
                      }
                    } else {
                      log("the value of validator is null");
                      return null;
                    }
                  }),
              Container(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          text: "State",
                          hint: "Al-Jazeriah",
                          onSave: (value) {
                            if (value != null) {
                              controller.city = value;
                            } else {
                              log("state value is null!");
                            }
                          },
                          onValidate: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return "This field  can't be empty!";
                              } else {
                                return null;
                              }
                            } else {
                              log("the value of validator is null");
                              return null;
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomTextFormField(
                              text: "Country",
                              hint: "Sudan",
                              onSave: (value) {
                                if (value != null) {
                                  controller.country = value;
                                } else {
                                  log("country value is null!");
                                }
                              },
                              onValidate: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return "This field  can't be empty!";
                                  } else {
                                    return null;
                                  }
                                } else {
                                  log("the value of validator is null");
                                  return null;
                                }
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    });
  }
}
