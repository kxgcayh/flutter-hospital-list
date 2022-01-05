import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:valbury_test/app/modules/clinic/views/clinic_view.dart';
import 'package:valbury_test/app/modules/home/views/home_view.dart';
import 'package:valbury_test/app/modules/hospital/views/hospital_view.dart';
import 'package:valbury_test/app/modules/profile/views/profile_view.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.initialIndex.value,
            children: [
              HomeView(),
              HospitalView(),
              ClinicView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: controller.initialIndex.value,
            onTap: controller.onChange,
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("HOME"),
                selectedColor: Colors.purple,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Hospital"),
                selectedColor: Colors.pink,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.search),
                title: Text("Clinic"),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        );
      },
    );
  }
}
