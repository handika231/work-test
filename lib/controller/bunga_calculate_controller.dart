import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';

class BungaCalculateController extends GetxController {
  final formKey = GlobalKey<FormState>(debugLabel: 'bungaform');
  TextEditingController inputController = TextEditingController();

  RxDouble oneMonth = 0.0.obs;
  RxDouble twoMonth = 0.0.obs;
  RxDouble threeMonth = 0.0.obs;
  RxDouble fourMonth = 0.0.obs;
  RxDouble fiveMonth = 0.0.obs;
  RxDouble sixMonth = 0.0.obs;

  @override
  void dispose() {
    inputController.dispose();
    inputController.clear();
    super.dispose();
  }

  void calculate() {
    if (formKey.currentState!.validate()) {
      double input = double.parse(inputController.text);
      if (input < 100000) {
        Get.snackbar(
          'Peringatan!',
          'Masukkan angka lebih dari 100.000',
          backgroundColor: Colors.amber[200],
          colorText: AppStyle.blackColor,
        );
      } else if (input >= 100000 && input < 500000) {
        _twoPercentAdmin(input);
      } else if (input >= 500000 && input < 10000000) {
        _threePercentAdmin(input);
      } else if (input >= 10000000 && input <= 50000000) {
        _fourPercentAdmin(input);
      } else {
        _fivePercentAdmin(input);
      }
    }
  }

  _twoPercentAdmin(double input) {
    double bunga = 0.02;
    int adminFee = 1500;
    oneMonth.value = input + (input * bunga * 1 - (adminFee * 1));
    twoMonth.value = input + (input * bunga * 2 - (adminFee * 2));
    threeMonth.value = input + (input * bunga * 3 - (adminFee * 3));
    fourMonth.value = input + (input * bunga * 4 - (adminFee * 4));
    fiveMonth.value = input + (input * bunga * 5 - (adminFee * 5));
    sixMonth.value = input + (input * bunga * 6 - (adminFee * 6));
  }

  _threePercentAdmin(double input) {
    double bunga = 0.03;
    int adminFee = 2000;
    oneMonth.value = input + (input * bunga * 1 - (adminFee * 1));
    twoMonth.value = input + (input * bunga * 2 - (adminFee * 2));
    threeMonth.value = input + (input * bunga * 3 - (adminFee * 3));
    fourMonth.value = input + (input * bunga * 4 - (adminFee * 4));
    fiveMonth.value = input + (input * bunga * 5 - (adminFee * 5));
    sixMonth.value = input + (input * bunga * 6 - (adminFee * 6));
  }

  void _fourPercentAdmin(double input) {
    double bunga = 0.04;
    int adminFee = 2500;
    oneMonth.value = input + (input * bunga * 1 - (adminFee * 1));
    twoMonth.value = input + (input * bunga * 2 - (adminFee * 2));
    threeMonth.value = input + (input * bunga * 3 - (adminFee * 3));
    fourMonth.value = input + (input * bunga * 4 - (adminFee * 4));
    fiveMonth.value = input + (input * bunga * 5 - (adminFee * 5));
    sixMonth.value = input + (input * bunga * 6 - (adminFee * 6));
  }

  void _fivePercentAdmin(double input) {
    double bunga = 0.05;
    int adminFee = 3000;
    oneMonth.value = input + (input * bunga * 1 - (adminFee * 1));
    twoMonth.value = input + (input * bunga * 2 - (adminFee * 2));
    threeMonth.value = input + (input * bunga * 3 - (adminFee * 3));
    fourMonth.value = input + (input * bunga * 4 - (adminFee * 4));
    fiveMonth.value = input + (input * bunga * 5 - (adminFee * 5));
    sixMonth.value = input + (input * bunga * 6 - (adminFee * 6));
  }
}
