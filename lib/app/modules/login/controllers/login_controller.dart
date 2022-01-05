import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:valbury_test/app/modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import 'package:valbury_test/app/modules/bottom_navigation/views/bottom_navigation_view.dart';
import 'package:valbury_test/app/modules/login/user_model.dart';

class LoginController extends GetxController {
  final g = GetStorage();
  final loginKey = GlobalKey<FormState>().obs;
  final user = User().obs;
  final areFormFilled = false;

  void updateUser(dynamic value, {required LoginInputType type}) {
    if (type == LoginInputType.phone) {
      user.value.phone = int.parse(value);
    } else if (type == LoginInputType.email) {
      user.value.email = value.toString();
    }
  }

  void submit() {
    if (loginKey.value.currentState != null) {
      loginKey.value.currentState!.save();
      g.write('user', user.value);
      BottomNavigationBinding().dependencies();
      Get.offAll(() => BottomNavigationView());
    }
  }

  @override
  void onClose() {}
}

enum LoginInputType { phone, email }
