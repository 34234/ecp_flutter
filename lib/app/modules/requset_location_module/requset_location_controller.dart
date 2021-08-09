import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class requsetLocationController extends GetxController{

btn_Next_click(){
  Get.back(result: true);
}

btn_Cancel_click(){
  Get.back(result: false);
}
}
