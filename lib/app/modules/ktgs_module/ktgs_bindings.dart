import 'package:ecp_mobile/app/modules/ktgs_module/ktgs_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ktgsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ktgsController());
  }
}