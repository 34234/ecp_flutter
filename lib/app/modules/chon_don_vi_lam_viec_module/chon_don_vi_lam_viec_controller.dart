import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/Donvi.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class chonDonViLamViecController extends GetxController{

  var list = [].obs;
  var itemSelect =Donvi().obs;

  @override
  void onInit() {
    super.onInit();
    GetDonvi();
  }

  GetDonvi() async {
    String url = "DanhMuc/LayCongTyDienLuc";
    await ApiRequest(url: url, data: null, para: null).get(
        onSuccess: (data) {
          list.value = LstDonviFromJson(data);
          // list.map((e) => lst.add(e));
        }
    );
  }

  Menuselect(e){
    this.itemSelect.value=e;
  }

  Widget MakePopupDonVi() {
    //homeController c = Get.find();
    var controller=this;
    return PopupMenuButton(
      onSelected: (e) => {controller.Menuselect(e)},
      child: Obx(()=> TextField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText:  controller.itemSelect.value.tenDviqly==null?"Chọn đơn vị": controller.itemSelect.value.tenDviqly,
          //labelStyle: TextStyle(color: Colors.orangeAccent),
          suffixStyle:  TextStyle(color: Colors.orangeAccent),
          suffixIcon:   Icon(Icons.keyboard_arrow_down  ,color: Colors.black12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
      )),
      itemBuilder: (context) {
        List<PopupMenuEntry<Object>> list = [];
        for (var i in controller.list) {
          list.add(
              PopupMenuItem<Donvi>(
                value: i,
                child:
                Row(children: [
                  if(controller.itemSelect.value==i) Icon(Icons.check) ,
                  Text(i.tenDviqly)],

                ),
              ))
          ;
        }
        return list;
      },

    );
  }

  ChangeDonviLamViec(){
      GlobalData.IDConnect=itemSelect.value.maDviqly;
      Get.offAndToNamed(Routes.MAIN);
  }

}
