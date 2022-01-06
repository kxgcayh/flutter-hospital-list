import 'package:get/get.dart';
import 'package:valbury_test/app/data/models/community_service_model.dart';

class CommunityServiceControllerController extends GetxController {
  RxList<CommunityService> communityService = RxList<CommunityService>();
  String filterRS = 'SEMUA', filterClinic = 'SEMUA';

  @override
  void onInit() {
    communityService.addAll([
      CommunityService(
        name: 'Rumah Sakit',
        data: [
          CommunityServiceData(
            name: "Rumah Sakit Paru Dr. M. Goenawan Partowidigdo",
            address: "Rumah Sakit Paru Dr. M. Goenawan Partowidigdo",
            phone: "0251-8253630",
            fax: "0251-8257662",
            email: "info@rspg-cisarua.co.id",
            category: "BPJS",
          ),
          CommunityServiceData(
            name: "Rumah Sakit Jiwa dr. H. Marzoeki Mahdi",
            address: "Jalan dr Sumeru Nomor 114 Kota Bogor 16111",
            phone: "2518324025",
            fax: "2518324025",
            email: "rsmm.bgr@gmail.com",
            category: "PARTNER",
          ),
          CommunityServiceData(
            name: "Rumah Sakit EMC Sentul",
            address: "Jalan MH Thamrin Kav 57, Bogor 16810",
            phone: "021-29672977",
            fax: "02129672978",
            email: "rsmm.bgr@gmail.com",
            category: "TERDEKAT",
          )
        ],
      ),
      CommunityService(
        name: 'Klinik',
        data: [
          CommunityServiceData(
            name: "Klinik Paru Dr. M. Goenawan Partowidigdo",
            address: "Klinik Paru Dr. M. Goenawan Partowidigdo",
            phone: "0251-8253630",
            fax: "0251-8257662",
            email: "info@rspg-cisarua.co.id",
            category: "BPJS",
          ),
          CommunityServiceData(
            name: "Klinik Jiwa dr. H. Marzoeki Mahdi",
            address: "Jalan dr Sumeru Nomor 114 Kota Bogor 16111",
            phone: "2518324025",
            fax: "2518324025",
            email: "rsmm.bgr@gmail.com",
            category: "PARTNER",
          ),
          CommunityServiceData(
            name: "Klinik EMC Sentul",
            address: "Jalan MH Thamrin Kav 57, Bogor 16810",
            phone: "021-29672977",
            fax: "02129672978",
            email: "rsmm.bgr@gmail.com",
            category: "TERDEKAT",
          )
        ],
      ),
    ]);
    super.onInit();
  }

  void updateFilter(String title, String type) {
    if (type == 'Rumah Sakit') {
      filterRS = title;
    } else if (type == 'Klinik') {
      filterClinic = title;
    }
    update();
  }

  List<String> getCategories(CommunityService communityService) {
    List<String> categories = [];
    categories.add('SEMUA');
    communityService.data.every((value) {
      if (!categories.contains(value.category)) categories.add(value.category);
      return true;
    });
    return categories;
  }

  CommunityService filterCommunities(String type) {
    final data = communityService.toList();
    return data.where((v) => v.name == type).first;
  }

  List<CommunityServiceData> filterData(CommunityService parent) {
    List<CommunityServiceData> temp = [];
    String tmpFilter = 'SEMUA';
    if (parent.name == 'Rumah Sakit') {
      tmpFilter = filterRS;
    } else if (parent.name == 'Klink') {
      tmpFilter = filterClinic;
    }
    parent.data.every((data) {
      if (tmpFilter != 'SEMUA') {
        if (data.category.contains(tmpFilter)) {
          if (!temp.contains(data)) temp.add(data);
        }
      } else {
        temp.add(data);
      }
      return true;
    });
    return temp;
  }

  @override
  void onClose() {}
}
