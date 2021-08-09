import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/TblKTGS.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ktgsController extends GetxController{

  List<TblKtgs> ktgs = [];
  var isLoading =false.obs;
  var count =0.obs;
  var tille="".obs;
  var ktgs_select =TblKtgs();
  int _currentPage=0;
  bool _fullItem=false;
  int trang_thai;
  String loai="";
  ScrollController controller;
  ResultSearch resultSearch =ResultSearch();
  String id_plv="";
  String iskt;
  @override
  void onInit() {
    super.onInit();
    // get parameter
    id_plv= Get.parameters["id_plv"];
    iskt= Get.parameters["iskt"];
    Getbbkt();
    controller = new ScrollController()..addListener(_scrollListener);

  }

  _scrollListener()  async {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 100) {
      print('ok load more');
      Getbbkt();
    }
  }

  showdetail(kgs){
    Get.toNamed(Routes.KTGS_PLV, arguments: kgs);
  }

  showSearch(){

  }

  Getbbkt() async {
    isLoading.value = true;
    if (_fullItem)
      return;
    _currentPage++;
    String url = "PLV/GetDsBienBanKT";
    var para = {
      "IDConect": GlobalData.IDConnect,
      "donvid": GlobalData.tblDonVi_current.id,
      "id_plv":id_plv,
      "iskt": iskt,
      "page": _currentPage,
      "tungay": resultSearch.tungay == "" ? "" : resultSearch.tungay,
      "denngay": resultSearch.denngay == null ? "" : resultSearch.denngay,
      "noiDung": resultSearch.noiDung == null ? "" : resultSearch.noiDung
    };
    ApiRequest(url: url, para: para).get(
        onSuccess: (d) {
          isLoading.value = false;
          var p = KTGSDs.fromJson(d);
          if (p.ktgs.length == 0) {
            _fullItem = true;
            count.value = 0;
            controller.removeListener(_scrollListener);
          } else {
            ktgs.addAll(p.ktgs);
            count.value = p.count;
          }
          update();
        },
        onError: (d) {
          isLoading.value = false;
        }
    );
  }
}
