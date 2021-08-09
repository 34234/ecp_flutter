import 'package:ecp_mobile/app/modules/chon_don_vi_lam_viec_module/chon_don_vi_lam_viec_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class chonDonViLamViecBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => chonDonViLamViecController());
  }
}