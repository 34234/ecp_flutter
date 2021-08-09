import 'dart:io';

import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/modules/main_module/main_controller.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/utils/lifecycleEventHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plv_dsController extends GetxController{

  List<Plv> plvs = [];
  var tille="".obs;
  var count=0.obs;
  var isLoading =false.obs  ;
  var plv_select =Plv();
  int _currentPage=0;
  bool _fullItem=false;
  int trang_thai;
  String loai="";
  ScrollController controller;
  ResultSearch resultSearch =ResultSearch();
  @override
  void onInit() {
    super.onInit();
    trang_thai= int.parse(Get.parameters["trang_thai"]);
    loai= Get.parameters["loai"];
    if(loai=="dang_thuc_hien")
      tille.value="đang thực hiện";
    else if (loai=="chua_thuc_hien")
      tille.value="chưa thực hiện";
    else if (loai=="ket_thuc")
      tille.value="đã kết thúc";
    getplv();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  getplv() async {
    isLoading.value=true;
    if(_fullItem)
      return;
    _currentPage++;
    String url="PLV/GetDsPhienLamViec";
    var para={
      "IDConect":GlobalData.IDConnect,
      "donvid":GlobalData.tblDonVi_current.id,
      "page":_currentPage,
      "trang_thai":trang_thai,
      "loai": loai,
      "UserId":GlobalData.KTGS?"": GlobalData.tblNhanVien.id, // nếu là ktgs thì dc lấy hết
      "pbid":resultSearch.phongBanId==null?0:resultSearch.phongBanId,
      "tungay":resultSearch.tungay==""?"":resultSearch.tungay,
      "denngay":resultSearch.denngay==null?"":resultSearch.denngay,
      "noiDung":resultSearch.noiDung==null?"":resultSearch.noiDung
    };

    ApiRequest(url: url,para: para).get(
        onSuccess: (d)
    {
      isLoading.value=false;
     var p=PhienLamViecDs.fromJson(d);
     if(p.plv.length==0) {
       _fullItem = true;
       count.value =0;
       controller.removeListener(_scrollListener);
        }else {
       plvs.addAll(p.plv);
       count.value = p.count;
     }
     update();
    },
      onError: (d){
        isLoading.value=false;
      }
    );

  }


   _scrollListener()  async {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 100) {
      print('ok load more');
      getplv();
    }
  }

  showdetail(plv) async{
    var result= await Get.toNamed(Routes.PLV_DETAIL, arguments:plv);
    if(result!=null && result.toString()=="delete"){
      this.plvs.remove(plv);
      update();
    }
  }

  void showSearch() async{
  var resul= await Get.toNamed(Routes.PLV_SEARCH_DIALOG);
    //apply search
   resultSearch=resul;
    if(resultSearch!=null){
      plvs.clear();
      _currentPage=0;
      _fullItem=false;
      getplv();
    }

  }
}
