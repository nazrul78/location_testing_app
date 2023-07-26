import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:location_test_app/src/controllers/location_controller.dart';

mixin class Base {
  // final configC = Get.put(ConfigController());
  final locationC = Get.put(LocationController());
}
