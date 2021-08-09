import 'package:ecp_mobile/app/modules/plv_ds_module/plv_ds_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plv_dsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => plv_dsController());
  }
}