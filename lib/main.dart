import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_test_app/src/app.dart';
import 'package:location_test_app/src/controllers/config_controller.dart';

void main() async {
  await Get.put(ConfigController()).initAppConfig();
  runApp(App());
}
