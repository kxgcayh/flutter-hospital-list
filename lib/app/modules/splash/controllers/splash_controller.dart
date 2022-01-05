import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:valbury_test/app/modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import 'package:valbury_test/app/modules/bottom_navigation/views/bottom_navigation_view.dart';
import 'package:valbury_test/app/modules/login/bindings/login_binding.dart';
import 'package:valbury_test/app/modules/login/views/login_view.dart';

class SplashController extends GetxController {
  final g = GetStorage();
  @override
  void onInit() {
    final userBox = g.read('user');
    Future.delayed(Duration(seconds: 2)).then((_) {
      LoginBinding().dependencies();
      if (userBox != null) {
        print('userBox:$userBox');
        BottomNavigationBinding().dependencies();
        Get.off(() => BottomNavigationView());
      } else {
        Get.off(() => LoginView());
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('ready');
  }

  @override
  void onClose() {}
}
