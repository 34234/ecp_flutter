import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/TblKTGS.dart';
import 'package:ecp_mobile/app/data/repository/plv_ds.dart';
import 'package:ecp_mobile/app/data/repository/tblImage.dart';
import 'package:ecp_mobile/app/data/repository/tblGroupImage.dart';
import 'package:ecp_mobile/app/modules/plv_ds_module/plv_provider.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:ecp_mobile/app/utils/CameraUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:path/path.dart';
import 'package:location/location.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class plv_detailController extends GetxController {
  var view_type = "g".obs;
  var plv = Plv().obs;
  var imgs = [].obs;
  var group_img = [].obs;
  var _ressult;
  CameraUtil c = CameraUtil();

  @override
  void onInit() {
    super.onInit();
    this.plv.value = Get.arguments;
    getgroupimage();

  }

  taophieukt() {
    String url = "";
    var para = {
      "IDConect": GlobalData.IDConnect,
      "username": GlobalData.tblNhanVien.username,
      "loai_ktgs":"KTPLV",
      "iddv":GlobalData.tblDonVi_current.id
    };
    if (GlobalData.KTGS == true) {
      return Row(children: [
        OutlinedButton(
            child: Text(
               "Tạo phiên KTHT",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              // check sự tồn tại của phiếu nếu chưa có thì hỏi có tạo phiếu không
              if (this.plv.value.id_ktgs != "") {
                var ressultdialog = false;
                ressultdialog = await Get.defaultDialog(
                    title: "Thông báo",
                    middleText:
                        "Phiên làm việc này đã được kiểm tra hiện trường, Anh/Chị có muốn tạo biên bản?",
                    onCancel: () {
                      //_ressult=false;
                    },
                    onConfirm: () {
                      Get.back(result: true);
                    });

                if (ressultdialog != true) {
                  return;
                }
              }
              url = "PLV/CreateBBKTGS?idphien=" + this.plv.value.id.toString();
              ApiRequest(url: url, para: para).get(onSuccess: (d) {
                var ktgs = tblKtgsFromJson(d);
                if(this.plv.value.id_ktgs==null || this.plv.value.id_ktgs=="")
                this.plv.value.id_ktgs = ktgs.id;
                else
                this.plv.value.id_ktgs =this.plv.value.id_ktgs + "|"+ ktgs.id;
                Get.toNamed(Routes.KTGS_PLV, arguments: ktgs);
              });
            }),
        SizedBox(
          width: 10,
        ),
        (this.plv.value.id_ktgs != null && this.plv.value.id_ktgs != "")
            ? OutlinedButton(
                child: Text("Biên bản hiện tại",
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (plv.value.id_ktgs.toString().indexOf("|") >=
                      0) // có trên 2 biên bản
                    Get.toNamed(Routes.KTGS,
                        parameters: {"id_plv": plv.value.id.toString()});
                  else {
                    url = "PLV/CreateBBKTGS?idphien=" +
                        this.plv.value.id.toString();
                    ApiRequest(url: url, para: para).get(onSuccess: (d) {
                      var ktgs = tblKtgsFromJson(d);
                      if(this.plv.value.id_ktgs==null || this.plv.value.id_ktgs=="")
                      this.plv.value.id_ktgs = ktgs.id;
                      else
                        this.plv.value.id_ktgs =this.plv.value.id_ktgs + "|"+ ktgs.id;
                      Get.toNamed(Routes.KTGS_PLV, arguments: ktgs);
                    });
                  }
                })
            : Container()
      ]);
    } else
      return Container();
  }

  getgroupimage() async {
    String url = "PLV/GetGroupImage";
    var para = {
      "IDConect": GlobalData.IDConnect,
    };
    ApiRequest(url: url, para: para).get(onSuccess: (d) {
      group_img.value =
          List<TblGroupImage>.from(d.map((x) => TblGroupImage.fromJson(x)));
      getImages();
      //this.ims.value.
    });
  }

  showOption(int GroupId) async {
    await c.getlocation();

    Get.bottomSheet(Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              title: Text("Lựa chọn ảnh",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent)),
            ),
            ListTile(
              title: Text("Từ camera",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.camera_alt_outlined),
              onTap: () async {
               await c.takeImage("c", GroupId, plv.value.id, plv.value.phongBanId,
                    (d) {
                  imgs.add(TblImage.fromJson(d));
                  update();
                });
                Get.back();
              },
            ),
            ListTile(
              title: Text("Từ thư viện",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.picture_as_pdf_sharp),
              onTap: ()async {
                await c.takeImage("g", GroupId, plv.value.id, plv.value.phongBanId,
                    (d) {
                  imgs.add(TblImage.fromJson(d));
                  update();
                });
                Get.back();
              },
            ),
            ListTile(
              title: Text("Thoát",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent)),
              leading: Icon(Icons.backspace),
              onTap: () {
                Get.back();
              },
            ),
          ],
        )));
  }

  getImages() async {
    String url = "PLV/GetDsAnhPhien";
    var para = {"IDConect": GlobalData.IDConnect, "IdPhien": plv.value.id};
    ApiRequest(url: url, para: para).get(onSuccess: (d) {
      imgs.value = List<TblImage>.from(d.map((x) => TblImage.fromJson(x)));
      update();
      //this.ims.value.
    });
  }

  showComment() {}

  changeView() {
    if (this.view_type.value == "g")
      this.view_type.value = "l";
    else
      this.view_type.value = "g";
    update();
  }

  void sendKetThucCV() {
    Plv_provider p = Plv_provider();
    p.sendKetThucCV(
        plv.value, (data) async => {await Get.back(result: "delete")});
  }
}
