
import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class registerController extends GetxController{
  TextEditingController txtfullname = TextEditingController();
  TextEditingController txtdonvi = TextEditingController();
  TextEditingController txtsdt = TextEditingController();


  BtnRegisterClick(){
    if(txtfullname.text=="" || txtsdt.text=="")
      {
        Get.snackbar("Lưu ý", "Anh chị chưa nhập đủ thông tin");
        return;
      }

    String url="DanhMuc/CreateUser/";
    var para={
      "fullname":txtfullname.text,
      "sdt":txtsdt.text
    };

    ApiRequest(url:url,para: para).get(onSuccess: (d) async{
      await Get.defaultDialog(title: "Thông báo",middleText: "Chúng tôi đã nhận được đăng ký của bạn. Quản trị sẽ liên lạc sớm nhất. Cảm ơn");
      Get.back();
    });
  }
}
