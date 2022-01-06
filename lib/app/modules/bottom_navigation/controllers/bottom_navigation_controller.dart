import 'package:get/get.dart';
import 'package:valbury_test/app/data/bindings/instance_binding.dart';
import 'package:valbury_test/app/modules/clinic/bindings/clinic_binding.dart';
import 'package:valbury_test/app/modules/home/bindings/home_binding.dart';
import 'package:valbury_test/app/modules/hospital/bindings/hospital_binding.dart';
import 'package:valbury_test/app/modules/profile/bindings/profile_binding.dart';

class BottomNavigationController extends GetxController {
  var initialIndex = 0.obs;

  @override
  void onInit() {
    _bindings();
    super.onInit();
  }

  void onChange(int value) {
    initialIndex.value = value;
    update();
    print(initialIndex);
  }

  @override
  void onClose() {}

  void _bindings() {
    InstanceBinding().dependencies();
    HomeBinding().dependencies();
    HospitalBinding().dependencies();
    ClinicBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
