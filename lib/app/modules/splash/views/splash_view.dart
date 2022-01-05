import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_test/app/modules/home/views/home_view.dart';
import 'package:valbury_test/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 382,
              height: 82,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo-valbury.png'),
                ),
              ),
            ),
            Text('Jaga kesehatan anda bersama kami'),
          ],
        ),
      ),
    );
  }
}
