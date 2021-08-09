
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_detail_module/plv_detail_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plv_detailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => plv_detailController());
  }
}