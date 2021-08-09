import 'package:ecp_mobile/app/modules/upload_image_free_module/upload_image_free_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class uploadImageFreeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => uploadImageFreeController());
  }
}