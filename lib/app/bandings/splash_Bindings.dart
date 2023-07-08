// ignore_for_file: file_names

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controller/controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<myController>(() => myController());
  }
}
