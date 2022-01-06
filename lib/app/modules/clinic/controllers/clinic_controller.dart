import 'package:get/get.dart';
import 'package:valbury_test/app/controllers/instance_controller.dart';
import 'package:valbury_test/app/data/models/instance_model.dart';

class ClinicController extends GetxController {
  final _instanceC = Get.find<InstanceController>();
  final _clinics = BaseInstance().obs;
  final List<String> _categories = [];
  final RxString _selectedFilter = 'SEMUA'.obs;

  String get filter => _selectedFilter.value;
  BaseInstance get clinics => _clinics.value;
  List<String> get categories => _categories;
  List<InstanceData> get data {
    return _instanceC.filterInstances(filter, base: clinics);
  }

  void updateFilter(String newFilter) {
    _selectedFilter.value = newFilter;
    update();
    print(data);
  }

  @override
  void onInit() {
    _clinics.value = BaseInstance(
      name: 'Klinik',
      data: [
        InstanceData(
          name: "Klinik Paru Dr. M. Goenawan Partowidigdo",
          address: "Jalan Cicantayan Nomor 104 Kota Bogor 31233",
          phone: "0251-8253630",
          fax: "0251-8257662",
          email: "info@rspg-cisarua.co.id",
          category: "BPJS",
        ),
        InstanceData(
          name: "Klinik Jiwa dr. H. Marzoeki Mahdi",
          address: "Jalan dr Sumeru Nomor 114 Kota Bogor 16111",
          phone: "2518324025",
          fax: "2518324025",
          email: "rsmm.bgr@gmail.com",
          category: "PARTNER",
        ),
        InstanceData(
          name: "Klinik EMC Sentul",
          address: "Jalan MH Thamrin Kav 57, Bogor 16810",
          phone: "021-29672977",
          fax: "02129672978",
          email: "rsmm.bgr@gmail.com",
          category: "TERDEKAT",
        ),
      ],
    );
    _categories.add('SEMUA');
    _categories.addAll(_instanceC.categories(clinics));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
