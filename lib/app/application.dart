import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_test/common/app_style.dart';
import 'package:work_test/controller/bunga_calculate_controller.dart';
import 'package:work_test/controller/bunga_dinamis_controller.dart';
import 'package:work_test/controller/rent_house_controller.dart';
import 'package:work_test/views/bunga_calculate_view.dart';
import 'package:work_test/views/bunga_dinamis_view.dart';
import 'package:work_test/views/calculator_view.dart';
import 'package:work_test/views/form_view.dart';
import 'package:work_test/views/input_view.dart';
import 'package:work_test/views/rent_house_view.dart';

import '../controller/calculator_controller.dart';
import '../controller/form_controller.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppStyle.primaryColor,
          centerTitle: true,
        ),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const InputView(),
        ),
        GetPage(
          name: '/form',
          page: () => const FormView(),
          binding: BindingsBuilder(() {
            Get.put(FormController());
          }),
        ),
        GetPage(
          name: '/rent-house',
          page: () => const RentHouseView(),
          binding: BindingsBuilder(() {
            Get.put(RentHouseController());
          }),
        ),
        GetPage(
          name: '/calculator',
          page: () => const CalculatorView(),
          binding: BindingsBuilder(() {
            Get.put(CalculatorController());
          }),
        ),
        GetPage(
          name: '/bunga',
          page: () => const BungaCalculateView(),
          binding: BindingsBuilder(() {
            Get.put(BungaCalculateController());
          }),
        ),
        GetPage(
          name: '/bunga-dinamis',
          page: () => const BungaDinamisView(),
          binding: BindingsBuilder(() {
            Get.put(BungaDinamisController());
          }),
        ),
      ],
      home: const InputView(),
      debugShowCheckedModeBanner: false,
      title: 'Work Test',
    );
  }
}
