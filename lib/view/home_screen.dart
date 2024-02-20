import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<AuthViewModel> {
  final List<String> names = [
    "Men",
    "Women",
    "Devices",
    "Games",
    "Gadgets",
    "S",
    "S",
    "S",
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            _searchTextFormField(),
            const SizedBox(
              height: 30,
            ),
            const CustomText(text: "Categories", fontSize: 20),
            const SizedBox(
              height: 30,
            ),
            _listViewCategory(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "Products", fontSize: 20),
                CustomText(text: "See All", fontSize: 16),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _listViewProducts(),
          ],
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ))),
    );
  }

  Widget _listViewCategory() {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/Icon_Mens Shoe.png"),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomText(text: names[index], fontSize: 14)
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }

  _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              children: [
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    height: 220,
                    child: Image.asset(
                      "assets/images/Image.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: "Leather Wristwatch",
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: "Tag Heuer",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: "\$750",
                  fontSize: 14,
                  color: primaryColor,
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 20,
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text("Explore"),
          ),
          label: "",
          icon: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Image.asset(
              "assets/images/Icon_Explore.png",
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Text("Cart"),
          label: "",
          icon: Image.asset(
            "assets/images/Icon_Cart.png",
            fit: BoxFit.contain,
            width: 20,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Text("Profile"),
          label: "",
          icon: Image.asset(
            "assets/images/Icon_User.png",
            fit: BoxFit.contain,
            width: 20,
          ),
        ),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}
