import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:valbury_test/app/modules/clinic/controllers/clinic_controller.dart';
import 'package:valbury_test/app/modules/home/controllers/home_controller.dart';
import 'package:valbury_test/app/modules/hospital/controllers/hospital_controller.dart';
import 'package:valbury_test/app/views/views/instance_dashboard_view.dart';

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
            expandedHeight: 110.0,
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
              GetBuilder<HospitalController>(builder: (controller) {
                return InstanceDashboardView(
                  controller.hospitals,
                  instances: controller.data,
                  categories: controller.categories,
                  filter: controller.filter,
                  onTapFilter: (String f) => controller.updateFilter(f),
                );
              }),
              Column(
                children: [
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
                              padding: const EdgeInsets.fromLTRB(0, 12, 10, 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: const Offset(
                                        0.8,
                                        0.8,
                                      ),
                                      blurRadius: 5.0,
                                      spreadRadius: 0.5,
                                    ), //BoxShadow
                                  ],
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
                ],
              ),
              GetBuilder<ClinicController>(builder: (controller) {
                return InstanceDashboardView(
                  controller.clinics,
                  instances: controller.data,
                  categories: controller.categories,
                  filter: controller.filter,
                  onTapFilter: (String f) => controller.updateFilter(f),
                );
              }),
            ]),
          )
        ],
      ),
    );
  }
}
