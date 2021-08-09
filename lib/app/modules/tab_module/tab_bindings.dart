import 'package:ecp_mobile/app/modules/tab_module/tab_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class tabBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => tabController());
  }
}