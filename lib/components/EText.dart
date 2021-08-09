import 'package:ecp_mobile/app/modules/main_module/main_controller.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EText extends Text{
  EText(String data) : super(data);
}

Widget BuiltDraw(){
  var c =Get.find<mainController>();
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage(AppImage.bg1),fit: BoxFit.fitWidth )
            //color: Colors.white38,
          ),
          child: Container(
              child:Text(
            'ECP - Quản lý an toàn lao động',
            style: TextStyle(color:Colors.redAccent // Colors.redAccent,
              ,fontSize: 24,
            ),
          )),
        ),
         ListTile(
           onTap: (){
             c.gotoplvds_dlv();
           },
          leading: Icon(CupertinoIcons.hammer),
          title: Text('Phiếu công tác đang thực hiện'),
        ),
        ListTile(
          onTap: (){
            c.gotoplvds_cth();
          },
          leading: Icon(CupertinoIcons.photo_on_rectangle),
          title: Text('Phiếu công tác chưa thực hiện'),
        ),
        ListTile(
          onTap: (){
            c.gotoplvds_dkt();
          },
          leading: Icon(CupertinoIcons.archivebox),
          title: Text('Phiếu công tác đã thực hiện'),
        ),
        ListTile(
          onTap: (){
            c.gotoPageUploadImageFree();
          },
          leading: Icon(CupertinoIcons.exclamationmark_shield),
          title: Text('Tải ảnh không theo phiên'),
        ),
        // ListTile(
        //   leading: Icon(CupertinoIcons.gear_alt),
        //   title: Text('Quản lý công cụ dụng cụ sản xuất'),
        // ),
        // ListTile(
        //   leading: Icon(CupertinoIcons.lock),
        //   title: Text('Quản lý công cụ dụng cụ an toàn'),
        // ),
        ListTile(
          leading: Icon(Icons.logout ,color: Colors.redAccent,),
          title: Text('Đăng xuất',style: TextStyle(color:Colors.redAccent),),
          onTap: (){
          c.Logout();
            },
        ),
      ],
    ),
  );
}