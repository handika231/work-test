import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';
import 'package:work_test/common/gender.dart';
import 'package:work_test/controller/form_controller.dart';
import 'package:work_test/views/input_view.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: controller.nameController,
              validator: (value) =>
                  value!.length < 5 ? 'Nama minimal 5 karakter' : null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                labelText: 'Nama',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.emailController,
              validator: (value) =>
                  !value!.isEmail ? 'Yang anda masukan bukan email' : null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => DropdownButtonFormField<Gender>(
                value: controller.gender.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value == null ? 'Silahkan pilih jenis kelamin' : null,
                items: const [
                  DropdownMenuItem<Gender>(
                    value: Gender.men,
                    child: Text('Pria'),
                  ),
                  DropdownMenuItem(
                    value: Gender.women,
                    child: Text('Wanita'),
                  ),
                ],
                onChanged: (val) {
                  controller.gender.value = val!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.ageController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp('^[1-9][0-9]?\$|^100\$'),
                ),
                LengthLimitingTextInputFormatter(3),
              ],
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.length < 2 ? 'Umur minimal 10-100' : null,
              decoration: const InputDecoration(
                hintText: 'masukkan umur anda 10-100',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                labelText: 'Umur',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.numberPhoneController,
              inputFormatters: [LengthLimitingTextInputFormatter(14)],
              decoration: const InputDecoration(
                hintText: 'masukkan no telp anda 9-14 karakter',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                labelText: 'No Telepon',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Masukkan nomor';
                }
                if (!RegExp('^.{9,14}\$').hasMatch(value)) {
                  return 'Masukkan angka 9-14 karakter';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isNotEmpty && value.length < 5) {
                  return 'minimal 5 karakter';
                }
                return null;
              },
              controller: controller.educationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                labelText: 'Pendidikan',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyle.primaryColor,
                fixedSize: const Size(double.infinity, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  _showDialog();
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: 'Data yang anda masukan',
      textConfirm: 'OK',
      onConfirm: () {
        Get.offAll(InputView());
      },
      content: Column(
        children: [
          Text(
            'Nama : ${controller.nameController.text}',
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Email : ${controller.emailController.text}',
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Jenis Kelamin : ${controller.gender.value}',
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Umur : ${controller.ageController.text}',
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'No Telepon : ${controller.numberPhoneController.text}',
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Pendidikan : ${controller.educationController.text}',
          ),
        ],
      ),
    );
  }
}
