import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/gender.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final gender = Gender.men.obs;
  TextEditingController numberPhoneController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  List<TextEditingController> controllers = [];
  @override
  void dispose() {
    controllers.addAll([
      nameController,
      emailController,
      ageController,
      numberPhoneController,
      educationController,
    ]);
    for (var controller in controllers) {
      controllers.clear();
      controller.dispose();
    }

    super.dispose();
  }
}
