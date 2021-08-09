// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:ecp_mobile/app/data/repository/tblPhongBan.dart';

List<TblDonVi> LstTblDonviFromJson(dynamic data) => List<TblDonVi>.from(data.map((x) => TblDonVi.fromJson(x)));

TblDonVi tblDonViFromJson(String str) => TblDonVi.fromJson(json.decode(str));

String tblDonViToJson(TblDonVi data) => json.encode(data.toJson());

class TblDonVi {
  TblDonVi({
    this.id,
    this.tenDonVi,
    this.tenVietTat,
    this.moTa,
    this.dviCha,
    this.capDvi,
    this.viTri,
    this.sdt,
    this.maLp,
    this.tblPhongBan,
  });
  String id;
  String tenDonVi;
  dynamic tenVietTat;
  dynamic moTa;
  dynamic dviCha;
  dynamic capDvi;
  dynamic viTri;
  dynamic sdt;
  dynamic maLp;
  List<TblPhongBan> tblPhongBan;

  factory TblDonVi.fromJson(Map<String, dynamic> json) => TblDonVi(
    id: json["Id"],
    tenDonVi: json["TenDonVi"],
    tenVietTat: json["TenVietTat"],
    moTa: json["MoTa"],
    dviCha: json["DviCha"],
    capDvi: json["CapDvi"],
    viTri: json["ViTri"],
    sdt: json["SDT"],
    maLp: json["MaLP"],
    tblPhongBan: List<TblPhongBan>.from(json["tblPhongBan"].map((x) => TblPhongBan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "TenDonVi": tenDonVi,
    "TenVietTat": tenVietTat,
    "MoTa": moTa,
    "DviCha": dviCha,
    "CapDvi": capDvi,
    "ViTri": viTri,
    "SDT": sdt,
    "MaLP": maLp,
    "tblPhongBan": List<TblPhongBan>.from(tblPhongBan.map((x) =>x)),
  };
}
