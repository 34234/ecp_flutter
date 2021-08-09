import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService{
  bool isShowDialog=false;

  Future<ConnectivityService> init() async {
    // TODO: implement onInit
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none)
    {
      isShowDialog=true;
      showDialog();
    }
    Connectivity().onConnectivityChanged.listen((event) {
      if(result == ConnectivityResult.none)
      {
        isShowDialog=true;
        showDialog();
      }else{
        if(isShowDialog){
          Get.back();
          isShowDialog=false;
        }
      }
    });
    return this;
  }


  showDialog(){
    Get.dialog(CupertinoAlertDialog(
      title: Text("Xin hãy kiểm tra lại kết nối")),
       barrierDismissible: false
    );
  }
}