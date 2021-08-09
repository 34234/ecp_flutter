import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get2;
import '../model/responsedata.dart';

class ApiRequest {
  //static String baseurl = "http://10.1.117.194/EcpApiNew/api/v1/";
  static String baseurl = "http://qlat.npc.com.vn/epc2/api/v1/";
  static String token = '';
  final String url;
  final Map para;
  final dynamic data;

  ApiRequest({
    this.data,
    @required this.url,
    this.para,
  });

  Dio _dio() {
    // Put your authorization token here

    return Dio(BaseOptions(
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
      baseUrl: baseurl,
      connectTimeout: 50000,
      receiveTimeout: 500000,
    ));
  }

  Future<void> get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) async {
    try {
    await  _dio().get(this.url, queryParameters: this.para).then((res) {
        if (onSuccess != null) {
          print('request from url' + this.url + ": " + res.toString());
          var _Reponsedata = ResponseData.fromJson(res.data);
          if (_Reponsedata.state == false)
            get2.Get.defaultDialog(
                title: "Lỗi", middleText: _Reponsedata.message);
          onSuccess(_Reponsedata.data);
        } else {
          get2.Get.defaultDialog(title: "Thông báo", middleText: "Lỗi API"+res.data);
        }
      }).catchError((error) {
        if (onError != null) onError(error);
        get2.Get.defaultDialog(title: "Thông báo", middleText: "Lỗi API"+error);
      });
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      get2.Get.defaultDialog(title: "Thông báo", middleText: "Lỗi API"+e.message);
    }
  }

  Future<void> post({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) async {
    try {
      await _dio()
          .post(this.url, queryParameters: this.para, data: this.data)
          .then((res) {
        try {
          if (onSuccess != null) {
            print('request from url' + this.url + ": " + res.toString());
            var _Reponsedata = ResponseData.fromJson(res.data);
            if (_Reponsedata.state == false)
              get2.Get.defaultDialog(middleText: _Reponsedata.message);
            onSuccess(_Reponsedata.data);
          }
        } catch (e) {
          get2.Get.defaultDialog(title: "Lỗi", middleText: "Lỗi API");
        }
      }).catchError((error) {
        if (onError != null) onError(error);
        get2.Get.defaultDialog(title: "Lỗi", middleText: "Lỗi API");
      });
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      get2.Get.defaultDialog(title: "Lỗi", middleText: "Lỗi API");
    }
  }

  void DownloadFileAsByte({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) async {
    _dio().get(this.url).then((res) {
      if (onSuccess != null) {
        print('download ');
        onSuccess(base64Decode(res.data.toString()));
      }
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void uploadFileAsByte({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) async {
    try {
      _dio()
          .post(this.url, queryParameters: this.para, data: this.data)
          .then((res) {
        print('request from url' + this.url + ": " + res.toString());
        var _Reponsedata = ResponseData.fromJson(res.data);
        if (_Reponsedata.state == false)
          get2.Get.defaultDialog(middleText: _Reponsedata.message);
        onSuccess(_Reponsedata.data);
      }).catchError((error) {
        if (onError != null) onError(error);
      });
    } catch (e) {
      print(e.toString());
      get2.Get.defaultDialog(middleText: "Lỗi upload :" + e.toString());
    }
  }
}
