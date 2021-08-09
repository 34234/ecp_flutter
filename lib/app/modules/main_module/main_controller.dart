import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/Count.dart';
import 'package:ecp_mobile/app/data/repository/Donvi.dart';
import 'package:ecp_mobile/app/data/repository/TblKTGS.dart';
import 'package:ecp_mobile/app/data/repository/tblDonvi.dart';
import 'package:ecp_mobile/app/data/repository/tblNhanVien.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:ecp_mobile/app/utils/CameraUtil.dart';
import 'package:ecp_mobile/app/utils/lifecycleEventHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class mainController extends GetxController{
 //var tblNhanVien=TblNhanVien().obs;
 var tblNhanVien=TblNhanVien().obs;
 var isLoading =false.obs;
 var donvi_select=TblDonVi().obs;
 var tblDonVis=[];
var count = Count().obs;
RefreshController refreshController = RefreshController(initialRefresh: true);



 @override
 void onInit() {
   super.onInit();
    this.tblDonVis=GlobalData.tblDonVis;
    this.donvi_select.value=this.tblDonVis[0];
    GlobalData.tblDonVi_current=donvi_select.value;
   tblNhanVien.value=GlobalData.tblNhanVien;
   GetTsoPhieuCongTac();
   //Getdata();
   WidgetsBinding.instance.addObserver(
       LifecycleEventHandler(resumeCallBack: () async
       {
         GetTsoPhieuCongTac();
       })
   );

 }


//  @override
//   void dispose() {
//   print('dispose');
//   }
//
//  @override
//   void onClose() {
//    refreshController.dispose();
// //
//   }

  Logout(){
   Get.offAllNamed(Routes.LOGIN);
 }

  @override
  void onReady() {
   print('ok ready');
  }

  Popselect(itemselect){
   GlobalData.tblDonVi_current=itemselect;
   donvi_select.value=itemselect;
   GetTsoPhieuCongTac();
 }

 GetTsoPhieuCongTac() async{
   String url="PLV/GetTSoPLV";
    var para= {
      "IDConect":GlobalData.IDConnect,
      "donvid":GlobalData.tblDonVi_current.id,
      "UserId":GlobalData.tblNhanVien.id,
    };

    ApiRequest(url: url,para: para).get(onSuccess: (d)
   {
     count.value=Count.fromJson(d);
   }
    );
 }

 void onRefreshPullDown() async{
   // if failed,use refreshFailed()
   GetTsoPhieuCongTac();
   refreshController.refreshCompleted();
 }

 void Taobbktgscs(){
   var para = {
     "IDConect": GlobalData.IDConnect,
     "username": GlobalData.tblNhanVien.username,
     "loai_ktgs":"KTCS",
     "iddv":GlobalData.tblDonVi_current.id
   };
   String url = "PLV/CreateBBKTGS?idphien=-1" ;
   ApiRequest(url: url, para: para).get(onSuccess: (d) {
     var ktgs = tblKtgsFromJson(d);
     Get.toNamed(Routes.KTGS_PLV, arguments: ktgs);
   });
 }

  void gotoPageKTGS() {
    Get.toNamed(Routes.KTGS,
        parameters: {"iskt": "true"});
  }
  void gotoPageUploadImageFree() {
    Get.toNamed(Routes.UPLOAD_IMAGE_FREE);
  }

  void gotoplvds_dkt() {
    Get.toNamed(Routes.PLV_DS, parameters: {
      "trang_thai": "3",
      "loai": "ket_thuc"
    });
  }

  void gotoplvds_dlv() {
    Get.toNamed(Routes.PLV_DS, parameters: {
      "trang_thai": "2",
      "loai": "dang_thuc_hien"
    });
  }

  void gotoplvds_cth() {
    Get.toNamed(Routes.PLV_DS, parameters: {
      "trang_thai": "2",
      "loai": "chua_thuc_hien"
    });
  }

  void gotoPagektgs_dth() {
    Get.toNamed(Routes.KTGS,
        parameters: {"iskt": "false"});
  }
}
