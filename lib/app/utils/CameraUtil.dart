
import 'dart:io';
import 'package:ecp_mobile/ApiRequest/apirequest.dart';
import 'package:ecp_mobile/ApiRequest/globalData.dart';
import 'package:ecp_mobile/app/data/repository/tblImage.dart';
import 'package:ecp_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:location/location.dart';
import 'package:dio/dio.dart' as dio;
import 'package:map_launcher/map_launcher.dart';
import 'package:path/path.dart';

class CameraUtil{
  CameraUtil() {
  }
  bool _ishow=false;
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  static LocationData _locationData;


  getlocation() async{
    // chưa rõ mỗi lần vào form cứ hỏi 1 lần cho chắc ăn
    if(GetPlatform.isAndroid && _ishow==false) {
      var result= await Get.toNamed(Routes.REQUSET_LOCATION);
      if(result==false)
          return;
      // Get.defaultDialog(title: "Thông báo",
      //     //content:Text(),
      //     middleText: "Chúng tôi sẽ thu thập dữ liệu định vị của bạn để làm thông tin cho ảnh chụp, chúng tôi sẽ không chia sẻ dữ liệu này cho bên thứ 3",
      //     textConfirm: "Đồng ý",
      //     onConfirm: () {
      //       Get.back();
      //     },
      //     textCancel: "Không đồng ý",
      //     onCancel: () {
      //       Get.back();
      //       return;
      //     },
      // );
      _ishow=true;
    }

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }


  takeImage(String type,int GroupId,int idplv,int idpb,Function(dynamic data) onSuccess) async {

    List<Media> f= [];
    if(type=="g")
      f= await ImagesPicker.pick( count: 10,
        pickType: PickType.all,
        quality: 0.8, // only for android
      ); // only for ios (kb);
    //.getImage(source:ImageSource.gallery,maxHeight: 800,maxWidth: 1000,imageQuality: 90);
    else {
      f = await ImagesPicker.openCamera(
        quality: 0.8,
        pickType: PickType.image,);
      if(f.length>0)
        ImagesPicker.saveImageToAlbum(File(f[0].path), albumName: "EPC");
    }
    //picker.getImage(source:ImageSource.camera,maxHeight: 800,maxWidth: 1000,imageQuality: 90);

    for(var i=0;i<f.length;i++){
      TblImage tblimg = TblImage(localFile: File(f[i].path),
          groupId: GroupId,
          phienLamViecId: idplv);
      uploadImage(tblimg,idpb,idplv,onSuccess);
    }
  }

  takeImageKTGS(String type,int GroupId,String id_ktgs,int idpb,Function(dynamic data) onSuccess) async {

    List<Media> f= [];
    if(type=="g")
      f= await ImagesPicker.pick( count: 10,
        pickType: PickType.all,
        quality: 0.8, // only for android
      ); // only for ios (kb);
    //.getImage(source:ImageSource.gallery,maxHeight: 800,maxWidth: 1000,imageQuality: 90);
    else {
      f = await ImagesPicker.openCamera(
        quality: 0.8,
        pickType: PickType.image,);
      if(f.length>0)
        ImagesPicker.saveImageToAlbum(File(f[0].path), albumName: "EPC");
    }
    //picker.getImage(source:ImageSource.camera,maxHeight: 800,maxWidth: 1000,imageQuality: 90);

    for(var i=0;i<f.length;i++){
      TblImage tblimg = TblImage(localFile: File(f[i].path),
          groupId: GroupId,
          phienLamViecId: -1,
          id_ktgs:  id_ktgs);
      uploadImage(tblimg,idpb,-1,onSuccess);
    }
  }

  uploadImage(TblImage img,int idpb,int idplv,Function(dynamic data) onSuccess) async{
    if(_locationData == null)
      await getlocation();
    String url="PLV/UploadImage";

    var para ={
      "IDConect":GlobalData.IDConnect,
      "iddv":GlobalData.tblDonVi_current.id,
      "id_phong": idpb
    };

    var f = dio.FormData.fromMap(
        {
          'phienLamViecId': idplv,
          'ID_KTGS': img.id_ktgs,
          "groupId":img.groupId,
          "ngayChup":DateTime.now(),
          "kinhDo":_locationData==null?0:_locationData.longitude,
          "viDo":_locationData==null?0:_locationData.latitude,
          'files':[
            dio.MultipartFile.fromFileSync(img.localFile.path, filename:basename(img.localFile.path)),
          ]
        }
    );

    ApiRequest(url: url,para: para,data: f).uploadFileAsByte(onSuccess: (d)
    {
      if(onSuccess!=null)
        onSuccess(d);
      //imgs.add(TblImage.fromJson(d));
      //update();
    });

  }

  //
  // takeImagektgs(String type,int GroupId,String id_ktgs,int idpb,Function(dynamic data) onSuccess) async {
  //   List<Media> f= [];
  //   if(type=="g")
  //     f= await ImagesPicker.pick( count: 10,
  //       pickType: PickType.all,
  //       quality: 0.8, // only for android
  //     ); // only for ios (kb);
  //   //.getImage(source:ImageSource.gallery,maxHeight: 800,maxWidth: 1000,imageQuality: 90);
  //   else {
  //     f = await ImagesPicker.openCamera(
  //       quality: 0.8,
  //       pickType: PickType.image,);
  //     if(f.length>0)
  //       ImagesPicker.saveImageToAlbum(File(f[0].path), albumName: "EPC");
  //   }
  //   //picker.getImage(source:ImageSource.camera,maxHeight: 800,maxWidth: 1000,imageQuality: 90);
  //
  //   for(var i=0;i<f.length;i++){
  //     TblImage tblimg = TblImage(localFile: File(f[i].path),
  //         groupId: GroupId,
  //         id_ktgs: id_ktgs);
  //     uploadImagektgs(tblimg,idpb,id_ktgs,onSuccess);
  //   }
  // }

  // uploadImagektgs(TblImage img,int idpb,int id_ktgs,Function(dynamic data) onSuccess){
  //
  //   String url="PLV/UploadImage";
  //
  //   var para ={
  //     "IDConect":GlobalData.IDConnect,
  //     "iddv":GlobalData.tblDonVi_current.id,
  //     "id_phong": idpb
  //   };
  //
  //   var f = dio.FormData.fromMap(
  //       {
  //         'phienLamViecId': -1,
  //         'ID_KTGS':img.id_ktgs,
  //         "groupId":img.groupId,
  //         "ngayChup":DateTime.now(),
  //         "kinhDo":_locationData.longitude,
  //         "viDo":_locationData.latitude,
  //         'files':[
  //           dio.MultipartFile.fromFileSync(img.localFile.path, filename:basename(img.localFile.path)),
  //         ]
  //       }
  //   );
  //
  //   ApiRequest(url: url,para: para,data: f).uploadFileAsByte(onSuccess: (d)
  //   {
  //     if(onSuccess!=null)
  //       onSuccess(d);
  //     //imgs.add(TblImage.fromJson(d));
  //     //update();
  //   });
  //
  // }






}

showLocation(dynamic vido,dynamic kinhdo) async{
  if (await MapLauncher.isMapAvailable(MapType.google)) {
    await MapLauncher.showMarker(
      mapType: MapType.google,
      coords: Coords(vido, kinhdo),
      title: "Địa điểm",
      description: "Địa điểm công tác",
    );
  }
}