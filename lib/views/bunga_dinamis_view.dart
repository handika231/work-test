import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:work_test/common/extension.dart';
import 'package:work_test/controller/bunga_dinamis_controller.dart';
import 'package:work_test/widgets/button_navigate_widget.dart';

import '../common/app_style.dart';

class BungaDinamisView extends GetView<BungaDinamisController> {
  const BungaDinamisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      appBar: AppBar(
        title: const Text('Bunga Dinamis View'),
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
                      flex: 3,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
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
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            controller.numberBunga.value = 0;
                          } else {
                            controller.numberBunga.value = int.parse(value);
                          }
                        },
                        controller: controller.numberController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.allow(RegExp(r'[1-6]'))
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Bulan',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return Obx(() {
                      return Column(
                        children: [
                          CustomButtonWidget(
                            onPressed: () {
                              setState(() {
                                controller.calculate();
                              });
                            },
                            text: 'Hitung',
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          controller.numberBunga.value == 0
                              ? const Text('Result Kosong')
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.numberBunga.value,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Text(
                                      'Bulan ke ${index + 1}: ${controller.listBunga[index].value.toRupiah}',
                                    );
                                  },
                                ),
                        ],
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
