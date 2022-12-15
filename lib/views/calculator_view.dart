import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/controller/calculator_controller.dart';

class CalculatorView extends GetView<CalculatorController> {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator View'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: TextFormField(
              keyboardType: TextInputType.number,
              controller: controller.firstNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            value: controller.isChecked.value,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
