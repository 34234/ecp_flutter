import 'package:ecp_mobile/app/data/repository/tblImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ImageViewDetailController extends GetxController{
  TextEditingController txtchat = TextEditingController();

TblImage img = TblImage();
// List<TblImage> imgs =[];
@override
  void onInit() {
  super.onInit();
  //var data = Get.arguments;
  this.img= Get.arguments;
  //this.imgs=data[1];
  }

  deleteImage() {
    Get.defaultDialog(
        title: "Thông báo", middleText: "Anh chị có chắc xóa ảnh này?",
        onConfirm: () {
        }, onCancel: () {
         }
    );
  }
  showBottomSheetChat() {
    Get.bottomSheet(SafeArea(child: Container(
      height: 300,
        color: Colors.white
        , child:Column(children: [
      Container(height: 200, child: ListView(
      children: img.tblCommentImage.map((e) =>
          ListTile(
            title: Text(e.username,style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(e.commentContent),
            trailing: Text(DateFormat("dd/MM/yyyy hh:mm").format(e.createTime).toString()),
       )
      ).toList()
    )),
      Divider(color: Colors.orangeAccent,),
      Row(children: [
        Expanded(child:  TextField(
          controller: txtchat,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: "Nội dung trao đổi",
            //labelStyle: TextStyle(color: Colors.orangeAccent),
            suffixStyle:  TextStyle(color: Colors.orangeAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
        ),),
        IconButton(icon: Icon(Icons.send), onPressed: ()=>{})
      ],)
    ],)

    )));
  }


}
