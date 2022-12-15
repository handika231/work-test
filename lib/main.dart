import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:work_test/app/application.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Application());
}
