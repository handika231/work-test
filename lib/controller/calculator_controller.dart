import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  final TextEditingController thirdNumberController = TextEditingController();

  final isChecked = false.obs;
  final result = 0.obs;
}
