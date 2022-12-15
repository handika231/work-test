import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_style.dart';

class BungaDinamisController extends GetxController {
  final formKey = GlobalKey<FormState>(debugLabel: 'bungaDinamisForm');
  TextEditingController inputController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final numberBunga = 0.obs;
  List<RxDouble> listBunga = [
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
  ];

  @override
  void dispose() {
    inputController.dispose();
    inputController.clear();
    numberController.dispose();
    numberController.clear();
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
    listBunga[0].value = input + (input * bunga * 1 - (adminFee * 1));
    listBunga[1].value = input + (input * bunga * 2 - (adminFee * 2));
    listBunga[2].value = input + (input * bunga * 3 - (adminFee * 3));
    listBunga[3].value = input + (input * bunga * 4 - (adminFee * 4));
    listBunga[4].value = input + (input * bunga * 5 - (adminFee * 5));
    listBunga[5].value = input + (input * bunga * 6 - (adminFee * 6));
  }

  _threePercentAdmin(double input) {
    double bunga = 0.03;
    int adminFee = 2000;
    listBunga[0].value = input + (input * bunga * 1 - (adminFee * 1));
    listBunga[1].value = input + (input * bunga * 2 - (adminFee * 2));
    listBunga[2].value = input + (input * bunga * 3 - (adminFee * 3));
    listBunga[3].value = input + (input * bunga * 4 - (adminFee * 4));
    listBunga[4].value = input + (input * bunga * 5 - (adminFee * 5));
    listBunga[5].value = input + (input * bunga * 6 - (adminFee * 6));
  }

  void _fourPercentAdmin(double input) {
    double bunga = 0.04;
    int adminFee = 2500;
    listBunga[0].value = input + (input * bunga * 1 - (adminFee * 1));
    listBunga[1].value = input + (input * bunga * 2 - (adminFee * 2));
    listBunga[2].value = input + (input * bunga * 3 - (adminFee * 3));
    listBunga[3].value = input + (input * bunga * 4 - (adminFee * 4));
    listBunga[4].value = input + (input * bunga * 5 - (adminFee * 5));
    listBunga[5].value = input + (input * bunga * 6 - (adminFee * 6));
  }

  void _fivePercentAdmin(double input) {
    double bunga = 0.05;
    int adminFee = 3000;
    listBunga[0].value = input + (input * bunga * 1 - (adminFee * 1));
    listBunga[1].value = input + (input * bunga * 2 - (adminFee * 2));
    listBunga[2].value = input + (input * bunga * 3 - (adminFee * 3));
    listBunga[3].value = input + (input * bunga * 4 - (adminFee * 4));
    listBunga[4].value = input + (input * bunga * 5 - (adminFee * 5));
    listBunga[5].value = input + (input * bunga * 6 - (adminFee * 6));
  }
}
