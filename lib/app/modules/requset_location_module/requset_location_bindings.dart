import 'package:ecp_mobile/app/modules/requset_location_module/requset_location_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class requsetLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => requsetLocationController());
  }
}