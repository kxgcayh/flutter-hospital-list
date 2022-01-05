import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/clinic_controller.dart';

class ClinicView extends GetView<ClinicController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClinicView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ClinicView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
