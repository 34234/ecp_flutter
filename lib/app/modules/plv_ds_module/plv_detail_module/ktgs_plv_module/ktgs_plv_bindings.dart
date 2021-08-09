
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/ktgs_plv_module/ktgs_plv_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ktgs_plvBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ktgs_plvController());
  }
}