import 'package:ecp_mobile/app/modules/main_module/main_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class mainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => mainController());
  }

}