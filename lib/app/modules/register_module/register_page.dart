import 'package:ecp_mobile/app/modules/login_module/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/register_module/register_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class registerPage extends GetView<registerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tạo tài khoản')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              obscureText: true,
              controller: controller.txtfullname,
              decoration:getLogideco("Họ và tên"),
            ),
            Padding(padding: EdgeInsets.all(5)),
            TextField(
              obscureText: true,
              controller: controller.txtsdt,
              decoration:getLogideco("Số điện thoại"),
            ),
            Padding(padding: EdgeInsets.all(5)),
            MaterialButton(
              minWidth: double.maxFinite, // set minWidth to maxFinite
              color: Colors.redAccent,
              onPressed:(){controller.BtnRegisterClick();},
              textColor: Colors.white,
              padding: EdgeInsets.all(10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.login),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("Đăng ký",)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
