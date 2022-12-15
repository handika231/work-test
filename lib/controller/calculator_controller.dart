import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final formKey = GlobalKey<FormState>(debugLabel: 'calculatorForm');
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  final TextEditingController thirdNumberController = TextEditingController();

  final isFirstChecked = false.obs;
  final isSecondChecked = false.obs;

  final isThirdChecked = false.obs;

  final result = 0.obs;

  int increment() {
    //jika yang di ceklis bernilai true maka akan di tambah
    result.value = 0;
    if (isFirstChecked.value) {
      result.value += int.parse(firstNumberController.text);
    }
    if (isSecondChecked.value) {
      result.value += int.parse(secondNumberController.text);
    }
    if (isThirdChecked.value) {
      result.value += int.parse(thirdNumberController.text);
    }
    return result.value;
  }

  int decrement() {
    result.value = 0;
    int firstNumber = 0;
    int secondNumber = 0;
    int thirdNumber = 0;
    if (isFirstChecked.value) {
      firstNumber = int.parse(firstNumberController.text);
    }
    if (isSecondChecked.value) {
      secondNumber = int.parse(secondNumberController.text);
    }
    if (isThirdChecked.value) {
      thirdNumber = int.parse(thirdNumberController.text);
    }
    result.value = firstNumber - secondNumber - thirdNumber;
    return result.value;
  }

  int multiply() {
    result.value = 0;
    int firstNumber = 1;
    int secondNumber = 1;
    int thirdNumber = 1;
    if (isFirstChecked.value) {
      firstNumber =
          isFirstChecked.value ? int.parse(firstNumberController.text) : 1;
    }
    if (isSecondChecked.value) {
      secondNumber =
          isSecondChecked.value ? int.parse(secondNumberController.text) : 1;
    }
    if (isThirdChecked.value) {
      thirdNumber =
          isThirdChecked.value ? int.parse(thirdNumberController.text) : 1;
    }
    result.value = firstNumber * secondNumber * thirdNumber;
    return result.value;
  }

  int divide() {
    result.value = 0;
    double firstNumber = 1;
    double secondNumber = 1;
    double thirdNumber = 1;
    if (isFirstChecked.value) {
      firstNumber =
          isFirstChecked.value ? double.parse(firstNumberController.text) : 1;
    }
    if (isSecondChecked.value) {
      secondNumber =
          isSecondChecked.value ? double.parse(secondNumberController.text) : 1;
    }
    if (isThirdChecked.value) {
      thirdNumber =
          isThirdChecked.value ? double.parse(thirdNumberController.text) : 1;
    }
    result.value = firstNumber / secondNumber ~/ thirdNumber;
    return result.value;
  }
}
