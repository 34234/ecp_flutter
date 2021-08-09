// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SumTTinCoBan SumTTinCoBanFromJson(String str) => SumTTinCoBan.fromJson(json.decode(str));

String SumTTinCoBanToJson(SumTTinCoBan data) => json.encode(data.toJson());

class SumTTinCoBan {
  SumTTinCoBan({
    this.PLV_Dang_Thuc_hien,
    this.PLV_Chua_Thuc_hien,
    this.ktgs_ckt,
    this.ktgs_kt
  });
  dynamic ktgs_kt;
  dynamic ktgs_ckt;
  dynamic PLV_Dang_Thuc_hien;
  dynamic PLV_Chua_Thuc_hien;

  factory SumTTinCoBan.fromJson(Map<String, dynamic> json) => SumTTinCoBan(
    PLV_Dang_Thuc_hien: json["PLV_Dang_Thuc_hien"],
    PLV_Chua_Thuc_hien: json["PLV_Chua_Thuc_hien"],
    ktgs_ckt: json["KTGS_CHUAKT"],
    ktgs_kt: json["KTGS_KT"],
  );

  Map<String, dynamic> toJson() => {
    "PLV_Dang_Thuc_hien": PLV_Dang_Thuc_hien,
    "PLV_Chua_Thuc_hien": PLV_Chua_Thuc_hien,
  };
}
