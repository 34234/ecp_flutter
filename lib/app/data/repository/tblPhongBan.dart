// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TblPhongBan tblPhongBanFromJson(String str) => TblPhongBan.fromJson(json.decode(str));

String tblPhongBanToJson(TblPhongBan data) => json.encode(data.toJson());

class TblPhongBan {
  TblPhongBan({
    this.id,
    this.tenPhongBan,
    this.moTa,
    this.maDVi,
    this.tenVietTat,
    this.sdt,
    this.loaiPb,
  });

  int id;
  String tenPhongBan;
  dynamic moTa;
  dynamic maDVi;
  dynamic tenVietTat;
  dynamic sdt;
  dynamic loaiPb;

  factory TblPhongBan.fromJson(Map<String, dynamic> json) => TblPhongBan(
    id: json["Id"],
    tenPhongBan: json["TenPhongBan"],
    moTa: json["MoTa"],
    maDVi: json["MaDVi"],
    tenVietTat: json["TenVietTat"],
    sdt: json["SDT"],
    loaiPb: json["LoaiPB"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "TenPhongBan": tenPhongBan,
    "MoTa": moTa,
    "MaDVi": maDVi,
    "TenVietTat": tenVietTat,
    "SDT": sdt,
    "LoaiPB": loaiPb,
  };
}
