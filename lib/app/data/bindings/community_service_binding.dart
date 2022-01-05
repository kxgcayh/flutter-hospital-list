import 'package:get/get.dart';
import 'package:valbury_test/app/controllers/community_service_controller_controller.dart';

class CommunityServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityServiceControllerController>(
      () => CommunityServiceControllerController(),
    );
  }
}
