import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/Donvi.dart';
import 'package:ecp_mobile/app/data/repository/roles.dart';
import 'package:ecp_mobile/app/data/repository/tblDonvi.dart';
import 'package:ecp_mobile/app/data/repository/tblNhanVien.dart';
import 'package:ecp_mobile/app/modules/login_module/localAuthen.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class loginController extends GetxController with SingleGetTickerProviderMixin{

  AnimationController _animationController;
  Animation<double> animationLogo;
  Animation<double> animationTextFieldUser;
  final duration = const Duration(milliseconds: 1000);

  TextEditingController txtusername = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  var list=[].obs;
  var itemSelect =Donvi().obs;
  var isloading = false.obs;
  var isfaceid =false.obs;
  LocalAuthen _localAuthen = LocalAuthen();

  @override
  void onInit() {
    super.onInit();
    GetDonvi();
    checkLocalAuthen();
    _animationController = AnimationController(duration: duration, vsync: this);

    animationLogo = Tween<double>(begin: 0, end: 150).animate(_animationController)
      ..addListener(() => update());
    animationTextFieldUser = Tween<double>(begin: Get.width, end: 0).animate(_animationController)
      ..addListener(() => update());

    _animationController.forward();
  }

BtnLoginClick() {
  var uname = txtusername.text;
  var pass =txtpass.text;
  var id_dv= itemSelect.value.maDviqly;
  if(uname =="") {
    Get.snackbar("Thông báo", "Bạn chưa nhập tên đăng nhập");
    return;
  }
  if(pass=="")
    {
      Get.snackbar("Thông báo", "Bạn chưa nhập mật khẩu");
      return;
    }
  if(id_dv==""){
    Get.snackbar("Thông báo", "Bạn chưa chọn đơn vị");
    return;
  }
  LoginSubmit(uname,pass,id_dv);
}
 //List<Donvi> list;
  LoginSubmit(String uname, String pass, String IDDV)
  async {

    try {

      this.isloading.value=true;
      if (itemSelect.value.maDviqly == null) {
        Get.snackbar("Thông báo", "Anh chị chưa chọn đơn vị");
        return;
      }
      String url = "/Auth/ECPAuth";
      var mbody = {
        'userName': uname,
        'password': pass,
        "id_dv": IDDV
      };

      if( await LoginOutApp(uname,pass)==false) {
        Get.snackbar("Thông báo", "username  và password chưa chính xác");
        return;
      }
      //sleep(Duration(seconds: 5));
      Dio dio = Dio();
      //String urlpost = "http://" + itemSelect.value.linkapi + url;
      //print('request post login11 from url: ' + urlpost);
      ApiRequest(data:mbody,url:url).post(onSuccess: (d) async{
        try {
          ApiRequest.token = d["Token"].toString();
          //await GetTTinNguoiDung(u.text,itemSelect.value.maDviqly);
          GlobalData.tblNhanVien = TblNhanVien.fromJson(d["tblNhanVien"]);
          GlobalData.IDConnect = IDDV; // ket noi
          GlobalData.roles = List<Roles>.from(
              d["roles"].map((x) => Roles.fromJson(x)));
         // kiểm tra quyền ktgs
          var ktgs = GlobalData.roles.where((e) => int.parse(e.id)==30).length;
          if(ktgs>0)
            GlobalData.KTGS=true;

          await loaddata();
           // Get.offAndToNamed(Routes.REQUSET_LOCATION);
          Get.offAndToNamed(Routes.MAIN);
          UpdateUseridOne();

          // save localdata
          prefs.setString('txtusername',uname) ;
          prefs.setString('txtpass',pass) ;
          prefs.setString('maDviqly',GlobalData.IDConnect) ;
          // }
          this.isloading.value = false;
        }catch(e){
          print(e);
        }
      },beforeSend: () {
        this.isloading.value=true;
      }
      );
      // var res = await dio.post(urlpost, data: mbody,
      //     options: Options(contentType: Headers.formUrlEncodedContentType));
      // print('data from url: ' + urlpost + ": " + res.data.toString());
      //var d = res.data as Map<String, dynamic>;

    }catch(e){
      print(e.toString());
      Get.snackbar("Thông báo lỗi", "Tên hoặc mật khẩu không chính xác");
    }finally
    {
    this.isloading.value=false;
    }
  }

  Menuselect(e) {
    itemSelect.value=e;
  }
  SharedPreferences prefs ;
  GetDonvi() async {
    try {
      prefs = await SharedPreferences.getInstance();
      txtusername.text = prefs.getString('txtusername') ?? "";
      //txtpass.text = prefs.getString('txtpass') ?? "";
      var maDviqly = prefs.getString('maDviqly') ?? "";


      String url = "DanhMuc/LayCongTyDienLuc";
      await ApiRequest(url: url, data: null, para: null).get(
          onSuccess: (data) {
            list.value = LstDonviFromJson(data);
            // ad thêm thằng đơn vị test
            list.value.add(Donvi(maDviqly: "PA04H",
                tenDviqly: "Đơn vị test",
                linkapi: "116.212.40.27:8044"));
            //
            if (maDviqly != "") {
              var lsttam = list.value.where((e) => e.maDviqly == maDviqly);
              if (lsttam.length > 0) {
                itemSelect.value = lsttam.first;
              }
            }
            // list.map((e) => lst.add(e));
          }
      );
    }catch(e){
      print(e);
    }
  }


  LoginOutApp(String uname,String Password) async {
    try {
      String url = "http://" + this.itemSelect.value.linkapi + "/Token";
      var data = {
        "username": uname,
        "password": Password,
        "grant_type": "password",
      };
      //ApiRequest(url:url,data: data,)
      Dio dio = Dio();
      var res = await dio.post(url, data: data,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      if (res.data != null) {
        return true;
      }
    }catch(e) {
      return false;
    }
  }

// lay theem thoong tin don vi
  loaddata()async{
    String url="DanhMuc/GetDonviCap3";
    String dvtk=GlobalData.tblNhanVien.donViId;
    if( GlobalData.KTGS==true)
      dvtk=""; /// tìm hết các đơn vị con
    var para= {
      "IDConnect":GlobalData.IDConnect,
      "madvi":dvtk
    };

   await ApiRequest(url:url,para: para).get(onSuccess: (d){
      var dv = LstTblDonviFromJson(d);
      GlobalData.tblDonVis=dv;
      // tblDonVis=dv;
      // Popselect(tblDonVis[0]);
    });
  }

  UpdateUseridOne(){
    OneSignal.shared.getDeviceState().then((deviceState) {
      String url="DanhMuc/UpdateDevice";
      var para={
        "IDConnect":GlobalData.IDConnect,
        "username":GlobalData.tblNhanVien.username,
        "userid":GlobalData.tblNhanVien.id,
        "deviceId":deviceState.userId,
        "devicetype":GetPlatform.isIOS?"IOS":"ANDROID",
      };
      ApiRequest(url: url,para: para).get(onSuccess: (d){});
      print("DeviceState: ${deviceState?.jsonRepresentation()}");
    });;
  }


  btnRegisterClick(){
    Get.toNamed(Routes.REGISTER);
  }

  BtnFaceId()async {
    var kt= await _localAuthen.authenticateWithBiometrics();
    if(kt) {
      var uname = prefs.getString('txtusername') ?? "";
      var pass = prefs.getString('txtpass') ?? "";
      var maDviqly = prefs.getString('maDviqly') ?? "";
      if(uname =="" || pass=="") {
        Get.snackbar(
            "Thông báo", "Anh/Chị phải đăng nhập để sử dụng tính năng ");
        return;
      }
      LoginSubmit(uname, pass, maDviqly);
    }
    }



  checkLocalAuthen() async{
    // chi chay ios
    if(GetPlatform.isIOS ==true){
     var ischeckbio=await _localAuthen.checkBiometrics();
     var facid=await _localAuthen.getAvailableBiometrics();

      if( ischeckbio==true)
        isfaceid.value=true;
    }
    return false;
  }
  }
