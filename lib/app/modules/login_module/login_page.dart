import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/app/data/repository/Donvi.dart';
import 'package:ecp_mobile/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecp_mobile/app/modules/login_module/login_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

getLogideco(String text) {
  InputDecoration login_deco = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: text,
    //labelStyle: TextStyle(color: Colors.orangeAccent),
    suffixStyle: TextStyle(color: Colors.orangeAccent),
    prefixIcon: Icon(
      text == "Mật khẩu"
          ? Icons.admin_panel_settings
          : Icons.account_circle_sharp,
      color: Colors.black12,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
  );
  return login_deco;
}

Widget MakePopupDonVi() {
  //homeController c = Get.find();
  loginController c = Get.find();
  return PopupMenuButton(
    onSelected: (e) => {c.Menuselect(e)},
    child: Obx(() => TextField(
          enabled: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: c.itemSelect.value.tenDviqly == null
                ? "Chọn đơn vị"
                : c.itemSelect.value.tenDviqly,
            //labelStyle: TextStyle(color: Colors.orangeAccent),
            suffixStyle: TextStyle(color: Colors.orangeAccent),
            suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
        )),
    itemBuilder: (context) {
      List<PopupMenuEntry<Object>> list = [];
      for (var i in c.list) {
        list.add(PopupMenuItem<Donvi>(
          value: i,
          child: Row(
            children: [
              if (c.itemSelect.value == i) Icon(Icons.check),
              Text(i.tenDviqly)
            ],
          ),
        ));
      }
      return list;
    },
  );
}

class loginPage extends GetView<loginController> {
  //LoginController c = Get.put(LoginController());


  //Loginpage({Key key, this.txtusername, this.txtpass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // txtusername.text = "npcit";
   // txtpass.text = "123456aA@";
    //txtusername.text="pa23_buivanduan";
    //txtpass.text="Zuanpr0@90";
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // bottomSheet:  Text(
        //   "Bản quyền thuộc về EVNNPC",
        //   style: TextStyle(
        //     fontSize: 14,
        //     color: Colors.blue,
        //   ),
        // ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImage.bg2), fit: BoxFit.fitHeight)),
            alignment: Alignment.center,
            child: GetBuilder<loginController>(
              builder: (c) {
                return AnimatedBuilder(
                    animation: c.animationTextFieldUser,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(c.animationTextFieldUser.value, 0),
                        child: child,
                      );
                    },
                    child: Container(
                        //margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        // color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "ECP",
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 80,
                                          fontWeight: FontWeight.bold),
                                    )
                                    //child: Text("Etest",style: TextStyle(color: Colors.redAccent,fontSize: 80,fontWeight: FontWeight.bold),)
                                    // Image(
                                    //   image: AssetImage("assets/images/logoflutter.png"),
                                    //   height: 200,
                                    // ),
                                    ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "Kiểm tra đột xuất hiện trường",
                                    //"test",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "version 1.0",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                MakePopupDonVi(),
                                Padding(padding: EdgeInsets.all(10)),
                                TextField(
                                  controller: controller.txtusername,
                                  decoration: getLogideco("Tên đăng nhập"),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                TextField(
                                  obscureText: true,
                                  controller: controller.txtpass,
                                  decoration: getLogideco("Mật khẩu"),
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                MaterialButton(
                                  minWidth: double
                                      .maxFinite, // set minWidth to maxFinite
                                  color: Colors.redAccent,
                                  onPressed: () => controller.BtnLoginClick(),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(10),
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.login),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Text(
                                        "Login",
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height:10),
                                Obx(()=>Visibility(
                                  child:GestureDetector
                                    (child:  CircleAvatar(backgroundColor: Colors.white,
                                    child: Image(image: AssetImage(AppImage.faceid),height: 32,)),
                                    onTap: (){controller.BtnFaceId();},
                                  ),visible: controller.isfaceid.value,
                                )),
                                Obx(() => Visibility(
                                      child: CircularProgressIndicator(),
                                      visible: controller.isloading.value,
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    controller.btnRegisterClick();
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Đăng ký tài khoản?",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                ),
                                //Spacer(),
                                //  ElevatedButton(onPressed: ()=>c.counter(), child: Text("count"),),],
                              ]),
                        )));
              },
            )
            // ),
            ));
  }
}
