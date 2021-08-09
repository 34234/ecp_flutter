
import 'package:get/get.dart';

import 'image_view_detail_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ImageViewDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageViewDetailController());
  }
}