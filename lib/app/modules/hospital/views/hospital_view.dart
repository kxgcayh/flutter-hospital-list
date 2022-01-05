import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hospital_controller.dart';

class HospitalView extends GetView<HospitalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HospitalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HospitalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
