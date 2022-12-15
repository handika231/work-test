import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';
import 'package:work_test/controller/calculator_dinamis_controller.dart';

class CalculatorDinamisView extends GetView<CalculatorDinamisController> {
  const CalculatorDinamisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              title: 'Pesan',
              middleText: 'Maaf untuk fitur ini saya kesusahan menjawab');
        },
        child: const Icon(Icons.help),
      ),
      appBar: AppBar(
        title: const Text('Calculator Dinamis View'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.buildCheckBoxes().length,
              itemBuilder: (BuildContext context, int index) {
                return controller.buildCheckBox();
              },
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyle.primaryColor,
              ),
              onPressed: () {},
              child: const Text(
                "Tambah Field",
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
