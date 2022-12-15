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
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Obx(
              () => CheckboxListTile(
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
                value: controller.isFirstChecked.value,
                onChanged: (_) {
                  controller.isFirstChecked.toggle();
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.secondNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                value: controller.isSecondChecked.value,
                onChanged: (_) {
                  controller.isSecondChecked.toggle();
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => CheckboxListTile(
                selectedTileColor: Colors.red,
                contentPadding: EdgeInsets.zero,
                title: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.thirdNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                value: controller.isThirdChecked.value,
                onChanged: (_) {
                  controller.isThirdChecked.toggle();
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _calculate(controller.increment());
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _calculate(controller.decrement());
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _calculate(controller.multiply());
                  },
                  child: const Text('x'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _calculate(controller.divide());
                  },
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text('Hasil: ${controller.result.value}'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculate(int function) {
    try {
      if (controller.isFirstChecked.value && controller.isSecondChecked.value ||
          controller.isFirstChecked.value && controller.isThirdChecked.value ||
          controller.isSecondChecked.value && controller.isThirdChecked.value) {
        function;
      } else {
        Get.snackbar(
          'Error',
          'Setidaknya 2 angka yang di ceklis',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
