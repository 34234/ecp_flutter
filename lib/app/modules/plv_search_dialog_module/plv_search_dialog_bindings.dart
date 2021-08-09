import 'package:ecp_mobile/app/modules/plv_search_dialog_module/plv_search_dialog_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plvSearchDialogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => plvSearchDialogController());
  }
}