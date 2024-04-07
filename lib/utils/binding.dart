import 'package:e_commerce_app/utils/local_storage_data.dart';
import 'package:e_commerce_app/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view_model/control_view_model.dart';
import 'package:e_commerce_app/view_model/home_view_model.dart';
import 'package:e_commerce_app/view_model/profile_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel(),fenix: true);
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel(), fenix: true);
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel(), fenix: true);
    Get.lazyPut(() => CheckoutViewModel(),fenix: true);
  }
}
