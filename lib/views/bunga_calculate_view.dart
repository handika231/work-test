import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';
import 'package:work_test/common/extension.dart';
import 'package:work_test/controller/bunga_calculate_controller.dart';

class BungaCalculateView extends GetView<BungaCalculateController> {
  const BungaCalculateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      appBar: AppBar(
        title: const Text('Bunga View'),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'calculate'.toPNG,
                  width: Get.width,
                  height: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Hitung Bunga',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'field harus diisi' : null,
                        controller: controller.inputController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixText: 'Rp.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.calculate();
                      },
                      child: const Text(
                        "Simpan",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Text(
                    'Bulan ke 1: ${controller.oneMonth.value.toRupiah}',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Text(
                    'Bulan ke 2: ${controller.twoMonth.value.toRupiah}',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Text(
                    'Bulan ke 3: ${controller.threeMonth.value.toRupiah}',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Text(
                    'Bulan ke 4: ${controller.fourMonth.value.toRupiah}',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Text(
                    'Bulan ke 5: ${controller.fiveMonth.value.toRupiah}',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Text(
                    'Bulan ke 6: ${controller.sixMonth.value.toRupiah}',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
