import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';

import '../widgets/button_navigate_widget.dart';

class InputView extends StatelessWidget {
  const InputView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input View'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/form');
        },
        backgroundColor: AppStyle.primaryColor,
        child: const Icon(Icons.forum),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              onPressed: () {
                Get.toNamed('/rent-house');
              },
              text: 'Rent House View',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              onPressed: () {
                Get.toNamed('/calculator');
              },
              text: 'Calculator View',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              onPressed: () {
                Get.toNamed('/bunga');
              },
              text: 'Bunga View',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              onPressed: () {
                Get.toNamed('/bunga-dinamis');
              },
              text: 'Bunga Dinamis View',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              onPressed: () {
                Get.toNamed('/calculator-dinamis');
              },
              text: 'Calculator Dinamis View',
            ),
          ],
        ),
      ),
    );
  }
}
