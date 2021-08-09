// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:ecp_mobile/app/data/repository/tblPhongBan.dart';

Count CountFromJson(String str) => Count.fromJson(json.decode(str));

String CountToJson(Count data) => json.encode(data.toJson());

class Count {
  Count({
    this.PLV_Dang_Thuc_hien,
    this.PLV_Chua_Thuc_hien,
    this.ktgs_ckt,
    this.ktgs_kt
  });
  int PLV_Dang_Thuc_hien;
  int PLV_Chua_Thuc_hien;
  int ktgs_ckt;
  int ktgs_kt;

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    PLV_Chua_Thuc_hien: json["PLV_Chua_Thuc_hien"],
    PLV_Dang_Thuc_hien: json["PLV_Dang_Thuc_hien"],
    ktgs_ckt: json["KTGS_CHUAKT"],
    ktgs_kt: json["KTGS_KT"],
  );

  Map<String, dynamic> toJson() => {
    "PLV_Chua_Thuc_hien": PLV_Chua_Thuc_hien,
    "PLV_Dang_Thuc_hien": PLV_Dang_Thuc_hien,
  };
}
