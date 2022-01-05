import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'LOGIN',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Form(
              key: controller.loginKey.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Input Your Phone Number',
                        labelText: 'Phone Number *',
                      ),
                      onSaved: (String? value) {
                        controller.updateUser(value,
                            type: LoginInputType.phone);
                      },
                      validator:
                          ValidationBuilder().phone().maxLength(10).build(),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Input Your Email',
                        labelText: 'Email *',
                      ),
                      onSaved: (String? value) {
                        controller.updateUser(
                          value,
                          type: LoginInputType.email,
                        );
                      },
                      validator: ValidationBuilder().email().build(),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = controller
                              .loginKey.value.currentState!
                              .validate();
                          if (isValid) {
                            Get.defaultDialog(
                              barrierDismissible: false,
                              title: '',
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(height: 20),
                                  Text('Please Wait'),
                                ],
                              ),
                            );
                            Future.delayed(Duration(seconds: 3))
                                .then((_) => controller.submit());
                          }
                        },
                        child: Text('SUBMIT'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
