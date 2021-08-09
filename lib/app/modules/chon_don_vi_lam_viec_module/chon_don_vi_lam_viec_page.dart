import 'package:ecp_mobile/app/data/repository/Donvi.dart';
import 'package:ecp_mobile/app/modules/login_module/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/chon_don_vi_lam_viec_module/chon_don_vi_lam_viec_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class chonDonViLamViecPage extends GetView<chonDonViLamViecController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chọn đơn vị làm việc")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          controller.MakePopupDonVi(),
          SizedBox(height: 10,),
          MaterialButton(
            minWidth: double.maxFinite, // set minWidth to maxFinite
            color: Colors.redAccent,
            onPressed: ()=> controller.ChangeDonviLamViec(),
            textColor: Colors.white,
            padding: EdgeInsets.all(10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.home),
                Padding(padding: EdgeInsets.all(5)),
                Text("Chuyển đơn vị làm việc",)],
            ),
          ),
        ],)
      ),
    );
  }


}

