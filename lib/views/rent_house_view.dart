import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';
import 'package:work_test/common/extension.dart';
import 'package:work_test/controller/rent_house_controller.dart';
import 'package:work_test/widgets/button_navigate_widget.dart';

class RentHouseView extends GetView<RentHouseController> {
  const RentHouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primaryColor,
        onPressed: () {
          Get.defaultDialog(
            title: 'Panduan',
            content: Column(
              children: const [
                Text('1 hari: 10.000'),
                Text('1 minggu (7 hari): 50.000'),
                Text('1 bulan (30 hari): 180.000'),
              ],
            ),
          );
        },
        child: const Icon(Icons.help),
      ),
      appBar: AppBar(
        title: const Text('Biaya Sewa Kost'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Image.asset(
              'calculate'.toPNG,
              width: Get.width,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildForm(
              controller.dayController,
              'Hari',
            ),
            const SizedBox(
              height: 12,
            ),
            _buildForm(
              controller.weekController,
              'Minggu',
            ),
            const SizedBox(
              height: 12,
            ),
            _buildForm(
              controller.monthController,
              'Bulan',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              onPressed: () {
                controller.calculate();
              },
              text: 'Hitung',
            )
          ],
        ),
      ),
    );
  }

  TextFormField _buildForm(TextEditingController controller, String label) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'field tidak boleh kosong';
        } else if (int.parse(value) < 1 || int.parse(value) > 365) {
          return 'field tidak boleh kurang dari 1 atau lebih dari 365';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
