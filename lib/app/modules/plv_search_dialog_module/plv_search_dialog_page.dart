import 'package:ecp_mobile/app/data/repository/tblPhongBan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/plv_search_dialog_module/plv_search_dialog_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plvSearchDialogPage extends GetView<plvSearchDialogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nhập thông tin tìm kiếm')),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            MakePopupPB(),
            SizedBox(height: 10,),
            TextField(
              controller: controller.txtnoidung,
              decoration: getLogideco("Từ khóa",Icons.message),
            ),
            SizedBox(height: 10,),
            //Row(children: [
             GestureDetector(
               onTap:() {
                 controller.showdatetungay(context);
               },
               child:  TextField(
               enabled: false,
               readOnly: true,
               controller: controller.tungay,
               decoration: getLogideco("Từ ngày",Icons.calendar_today_sharp),
               ),),
            SizedBox(height: 10,),
          GestureDetector(
            onTap:() {
              controller.showdatedenngay(context);
            },
            child: TextField(
                  enabled: false,
                  readOnly: true,
                  controller: controller.dengay,
                  decoration: getLogideco("Đến ngày",Icons.calendar_today_sharp),
                  )),
           // ],),

            MaterialButton(
              minWidth: double.maxFinite, // set minWidth to maxFinite
              color: Colors.redAccent,
              onPressed: ()=> controller.search(),
              textColor: Colors.white,
              padding: EdgeInsets.all(10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.login),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("Tìm kiếm",)],
              ),
            ),
          ],
        )
      ),
    );
  }


  Widget MakePopupPB() {
    //homeController c = Get.find();
    plvSearchDialogController c = Get.find();
    return PopupMenuButton(
      onSelected: (e) => {c.menuselect(e)},
      child: Obx(()=> TextField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText:  c.itemSelect.value.tenPhongBan==null?"Chọn phòng ban": c.itemSelect.value.tenPhongBan,
          //labelStyle: TextStyle(color: Colors.orangeAccent),
          suffixStyle:  TextStyle(color: Colors.orangeAccent),
          suffixIcon:   Icon(Icons.keyboard_arrow_down  ,color: Colors.black12),
          border: OutlineInputBorder(),
          ),
        ),
      ),
      itemBuilder: (context) {
        List<PopupMenuEntry<Object>> list = [];
        for (var i in c.listpb) {
          list.add(
              PopupMenuItem<TblPhongBan>(
                value: i,
                child:
                Row(children: [
                  if(c.itemSelect.value==i) Icon(Icons.check) ,
                  Text(i.tenPhongBan)],

                ),
              ))
          ;
        }
        return list;
      },

    );
  }


  getLogideco(String text,IconData){
    InputDecoration login_deco=InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelText: text,
      //labelStyle: TextStyle(color: Colors.orangeAccent),
      suffixStyle:  TextStyle(color: Colors.orangeAccent),
      prefixIcon:  Icon(IconData),//Icon(Icons.message),
      border: OutlineInputBorder(
      ),
    );
    return login_deco;
  }
}
