import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: Get.find<ProfileViewModel>(),
      builder: (controller) {
        if (controller.userModel == null) {
          // Show a loading indicator while waiting for _userModel to be initialized
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(controller.userModel!.pic),
                              ),
                              color: Colors.green.shade500,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: controller.userModel!.name!,
                                  fontSize: 32),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                  text: controller.userModel!.email,
                                  fontSize: 18)
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.green.shade500,),
                        title:
                            CustomText(text: "Edit Profile", fontSize: 18),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.edit_location, color: Colors.green.shade500,),
                        title:
                        CustomText(text: "Shipping Address", fontSize: 18),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.history, color: Colors.green.shade500,),
                        title:
                        CustomText(text: "Order History", fontSize: 18),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.credit_card, color: Colors.green.shade500,),
                        title:
                        CustomText(text: "Cards" , fontSize: 18),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.notifications, color: Colors.green.shade500,),
                        title:
                        CustomText(text: "Notifications", fontSize: 18),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.green.shade500,),
                        title:
                        CustomText(text: "Logout", fontSize: 18),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {
                          controller.signOut();},
                      ),
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
