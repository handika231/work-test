import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/extension.dart';

class RentHouseController extends GetxController {
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController weekController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers = [];

  void calculate() {
    if (formKey.currentState!.validate()) {
      int day = int.parse(dayController.text);
      int week = int.parse(weekController.text);
      int month = int.parse(monthController.text);
      int total = (day * 10000) + (week * 50000) + (month * 180000);
      Get.defaultDialog(
        title: 'Total Biaya',
        content: Text(total.toRupiah),
      );
    }
  }

  @override
  void dispose() {
    controllers.addAll([dayController, monthController, weekController]);
    for (var element in controllers) {
      element.dispose();
    }
    super.dispose();
  }
}
