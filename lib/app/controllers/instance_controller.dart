import 'package:get/get.dart';
import 'package:valbury_test/app/data/models/instance_model.dart';

class InstanceController extends GetxController {
  List<String> categories(BaseInstance baseInstance) {
    final List<String> categories = [];
    for (final instance in baseInstance.data) {
      if (!categories.contains(instance.category)) {
        categories.add(instance.category);
      }
    }
    return categories;
  }

  List<InstanceData> filterInstances(String category, {BaseInstance base}) {
    if (category == 'SEMUA') return base.data;
    return base.data.where((instance) {
      return instance.category == category;
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
