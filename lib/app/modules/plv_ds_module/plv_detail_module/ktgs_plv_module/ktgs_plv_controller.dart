import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/TblKTGS.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/data/repository/tblImage.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/utils/CameraUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ktgs_plvController extends GetxController{

  var istontai=false.obs;
  TextEditingController txtTP1 = TextEditingController();
  TextEditingController txtTP2 = TextEditingController();
  TextEditingController txtTP_CS1 = TextEditingController();
  TextEditingController txtTP_CS2 = TextEditingController();
  TextEditingController txtTP_GSD = TextEditingController();
  TextEditingController txtY1 = TextEditingController();
  TextEditingController txtY2 = TextEditingController();
  TextEditingController txtY3 = TextEditingController();
  TextEditingController txtY4 = TextEditingController();
  TextEditingController txtY5 = TextEditingController();
  TextEditingController txtY6 = TextEditingController();
  TextEditingController txtY7 = TextEditingController();
  TextEditingController txtY8 = TextEditingController();
  TextEditingController txtY9 = TextEditingController();

 // var plv = Plv().obs;
  var ktgs = TblKtgs().obs;
  var lstimg =[].obs;
  CameraUtil c = CameraUtil();

  @override
  void onInit() {
    this.ktgs.value=Get.arguments;
    // load image
    update_thong_tin_fromload();
    loadimage();
    this.txtTP1.text=GlobalData.tblNhanVien.tenNhanVien;
  }

  loadimage() {

    String url="PLV/GetDsAnhKTGS";
    var para= {
      "IDConect":GlobalData.IDConnect,
      "id_ktgs":ktgs.value.id,
    };
    ApiRequest(url:url,para: para).get(onSuccess: (d)
    {
      this.lstimg.value.addAll(List<TblImage>.from(d.map((x) => TblImage.fromJson(x))));
      update();
      //this.ims.value.
    });
  }

  takeImage(String s) async{
    await c.getlocation();
    c.takeImageKTGS(s, 1,ktgs.value.id,-1, (data) {
      this.lstimg.value.add(TblImage.fromJson(data));
      update();
    });
  }


  sendKetThucBBKT(){
    if(this.lstimg.length==0) {
      Get.snackbar("Thông báo",
          "Anh chị chưa upload ảnh biên bản. Đề nghị upload và kiểm tra lại");
      return;
    }

    // submit
    String url="PLV/UpdateBBKTGS";
    var para={
      "IDConect":GlobalData.IDConnect,
      "username":GlobalData.tblNhanVien.username,
    };

    update_thong_tin();
    ktgs.value.kethuc=true;

    var form =dio.FormData.fromMap(ktgs.value.toJson());

    ApiRequest(url: url,data:form,para: para).post(onSuccess: (d) async{
      //Get.offAllNamed(Routes.MAIN);
      //Get.offNamedUnt
      while(Routes.MAIN!=Get.currentRoute) {
           await Get.back();
         }
      Get.snackbar("Thông báo",
          "Cập nhật thành công");
    });

  }

  update_thong_tin(){
    this.ktgs.value.cotontai=istontai.value;
    this.ktgs.value.tpKt1= txtTP1.text;
    this.ktgs.value.tpKt2= txtTP2.text;
    this.ktgs.value.tpKtCs1= txtTP_CS1.text;
    this.ktgs.value.tpKtCs2= txtTP_CS2.text;
    this.ktgs.value.nguoiGsat= txtTP_GSD.text;
    this.ktgs.value.danhGiaY1= txtY1.text;
    this.ktgs.value.danhGiaY2= txtY2.text;
    this.ktgs.value.danhGiaY3= txtY3.text;
    this.ktgs.value.danhGiaY4= txtY4.text;
    this.ktgs.value.danhGiaY5= txtY5.text;
    this.ktgs.value.danhGiaY6= txtY6.text;
    this.ktgs.value.danhGiaY7= txtY7.text;
    this.ktgs.value.danhGiaY9=txtY9.text;
    this.ktgs.value.danhGiaY8=txtY8.text;


  }

  update_thong_tin_fromload() {
    istontai.value = this.ktgs.value.cotontai==null?false:this.ktgs.value.cotontai;
    txtTP1.text = this.ktgs.value.tpKt1;
    txtTP2.text = this.ktgs.value.tpKt2;
    txtTP_CS1.text = this.ktgs.value.tpKtCs1;
    txtTP_CS2.text = this.ktgs.value.tpKtCs2;
    txtTP_GSD.text = this.ktgs.value.nguoiGsat;
    txtY1.text = this.ktgs.value.danhGiaY1;
    txtY2.text = this.ktgs.value.danhGiaY2;
    txtY3.text = this.ktgs.value.danhGiaY3;
    txtY4.text = this.ktgs.value.danhGiaY4;
    txtY5.text = this.ktgs.value.danhGiaY5;
    txtY6.text = this.ktgs.value.danhGiaY6;
    txtY7.text = this.ktgs.value.danhGiaY7;
    txtY8.text=this.ktgs.value.danhGiaY8;
    txtY9.text=this.ktgs.value.danhGiaY9;
  }
}
