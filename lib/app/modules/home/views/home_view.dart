import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_test/app/controllers/community_service_controller_controller.dart';
import 'package:valbury_test/app/views/views/community_service_container_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leadingWidth: double.infinity,
            leading: Row(
              children: [
                SizedBox(width: 12),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(55 / 2),
                  ),
                  child: Center(
                    child: Text(
                      'icon',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(55 / 2),
                ),
                child: Center(
                  child: Text(
                    'icon',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
            ],
            expandedHeight: 220.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 50,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                // padding: EdgeInsets.symmetric(horizontal: 12),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.size.width / 3.1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: Text(
                        'LABEL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.size.width / 3.1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: Text(
                        'LABEL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              background: Image.network(
                'http://www.bartush.com/wp-content/uploads/2016/04/Hospital-building-sign-closeup.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              GetBuilder<CommunityServiceControllerController>(
                builder: (controller) {
                  return Column(
                    children: [
                      CommunityServiceContainerView(
                        communities: controller.filterCommunities(
                          'Rumah Sakit',
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(2, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 80,
                                        vertical: 40,
                                      ),
                                      child: Center(
                                        child: Text('Banner ${index + 1}'),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      CommunityServiceContainerView(
                        communities: controller.filterCommunities(
                          'Klinik',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
