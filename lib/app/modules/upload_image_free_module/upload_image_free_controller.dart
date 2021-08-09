import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/tblImage.dart';
import 'package:ecp_mobile/app/utils/CameraUtil.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class uploadImageFreeController extends GetxController{

  List<TblImage> lst=[];
  CameraUtil c;
  @override
  void onInit() {
    super.onInit();
    c = CameraUtil();

  }

  takeImage(String g) async{
    await c.getlocation();
    c.takeImage(g, 0, 0, GlobalData.tblNhanVien.phongBanId, (data){
      lst.add(TblImage.fromJson(data));
      update();

    });
  }



}
