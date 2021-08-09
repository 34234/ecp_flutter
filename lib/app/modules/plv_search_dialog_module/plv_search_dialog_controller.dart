
import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/data/repository/tblPhongBan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plvSearchDialogController extends GetxController{
  var itemSelect =TblPhongBan().obs;
  var listpb =[].obs;
  TextEditingController txtnoidung = TextEditingController();
  TextEditingController tungay =  TextEditingController();
  TextEditingController dengay = TextEditingController();
  DateFormat dateformat= DateFormat("dd/MM/yyyy hh:ss");


  @override
  void onInit() {
    super.onInit();
    loadmpb();
  }

  loadmpb(){
    String url="/DanhMuc/GetPb";
    var para ={
      "iddv":GlobalData.tblDonVi_current.id,
      "IDConnect":GlobalData.IDConnect
    };
    ApiRequest(url: url,para: para).get(onSuccess: (d){
      listpb.value= List<TblPhongBan>.from(d.map((x) => TblPhongBan.fromJson(x)));
    });

  }

  menuselect(item){
    itemSelect.value=item;
  }

  showdatetungay( BuildContext context){
    showdate(context,(d){
      tungay.text = dateformat.format(d).toString();
    });
  }
  showdatedenngay( BuildContext context){
    showdate(context,(d){
      dengay.text = dateformat.format(d).toString();
    });
  }

  showdate(BuildContext context,Function(DateTime values) sucess){
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2017, 1, 1),
        maxTime: DateTime.now(),
        theme: DatePickerTheme(
            headerColor: Colors.blueAccent,
            backgroundColor: Colors.black26,
            itemStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            doneStyle:
            TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {

        }, onConfirm: (date) {
          sucess(date);
        }, currentTime: DateTime.now(), locale: LocaleType.vi);
  }

  search() {
    var result = ResultSearch(
        tungay: tungay.text,
        denngay: dengay.text,
        noiDung: txtnoidung.text,
        phongBanId: itemSelect == null ? -1 : itemSelect.value.id

    );
    Get.back(result: result);
  }
}
