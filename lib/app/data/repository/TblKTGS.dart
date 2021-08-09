// To parse this JSON data, do
//
//     final tblKtgs = tblKtgsFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

List<TblKtgs> ListtblKtgsFromJson(dynamic d) => List<TblKtgs>.from(d.map((e)=>TblKtgs.fromJson(e)));

TblKtgs tblKtgsFromJson(dynamic str) => TblKtgs.fromJson(str);

String tblKtgsToJson(TblKtgs data) => json.encode(data.toJson());

KTGSDs phienLamViecDsFromJson(String str) => KTGSDs.fromJson(json.decode(str));


class KTGSDs {
  KTGSDs({
    this.count,
    this.ktgs,
  });

  int count;
  List<TblKtgs> ktgs;

  factory KTGSDs.fromJson(Map<String, dynamic> json) => KTGSDs(
    count: json["count"],
    ktgs: List<TblKtgs>.from(json["ktgs"].map((x) => TblKtgs.fromJson(x))),
  );

}

DateFormat dateformat= DateFormat("dd/MM/yyyy hh:ss");
class TblKtgs {
  TblKtgs({
    this.id,
    this.maPct,
    this.donViId,
    this.idPlv,
    this.diaDiem,
    this.thoiGian,
    this.donViCoSo,
    this.noiDungCongViec,
    this.danhGiaY1,
    this.danhGiaY2,
    this.danhGiaY3,
    this.danhGiaY4,
    this.danhGiaY5,
    this.danhGiaY6,
    this.danhGiaY7,
    this.danhGiaY8,
    this.nguoiChtt,
    this.daiDienDvcs,
    this.daiDienDoan,
    this.tpKt1,
    this.tpKt2,
    this.tpKtCs1,
    this.tpKtCs2,
    this.nguoiChiHuyTt,
    this.nguoiGsat,
    this.kethuc,
    this.cotontai,
    this.danhGiaY9,
    this.loaiktgs,
    this.thoiGian_dis
  });

  dynamic id;
  dynamic maPct;
  dynamic donViId;
  dynamic idPlv;
  dynamic diaDiem;
  dynamic thoiGian;
  dynamic donViCoSo;
  dynamic noiDungCongViec;
  dynamic danhGiaY1;
  dynamic danhGiaY2;
  dynamic danhGiaY3;
  dynamic danhGiaY4;
  dynamic danhGiaY5;
  dynamic danhGiaY6;
  dynamic danhGiaY7;
  dynamic danhGiaY8;
  dynamic danhGiaY9;
  dynamic nguoiChtt;
  dynamic daiDienDvcs;
  dynamic daiDienDoan;
  dynamic tpKt1;
  dynamic tpKt2;
  dynamic tpKtCs1;
  dynamic tpKtCs2;
  dynamic nguoiChiHuyTt;
  dynamic nguoiGsat;
  dynamic kethuc;
  dynamic cotontai;
  dynamic loaiktgs;
  dynamic thoiGian_dis;
  factory TblKtgs.fromJson(Map<String, dynamic> json) => TblKtgs(
    id: json["ID"],
    maPct: json["MA_PCT"],
    donViId: json["DonViId"],
    idPlv: json["ID_PLV"],
    diaDiem:json["DiaDiem"]==null?"": json["DiaDiem"],
    thoiGian: json["ThoiGian"],//==null?"":dateformat.format(DateTime.parse(json["ThoiGian"])),
    thoiGian_dis:json["ThoiGian"]==null?"":dateformat.format(DateTime.parse(json["ThoiGian"])),
    donViCoSo: json["DonViCoSo"],
    noiDungCongViec:json["NoiDungCongViec"]==null?"": json["NoiDungCongViec"],
    danhGiaY1: json["DanhGiaY1"],
    danhGiaY2: json["DanhGiaY2"],
    danhGiaY3: json["DanhGiaY3"],
    danhGiaY4: json["DanhGiaY4"],
    danhGiaY5: json["DanhGiaY5"],
    danhGiaY6: json["DanhGiaY6"],
    danhGiaY7: json["DanhGiaY7"],
    danhGiaY8: json["DanhGiaY8"],
    nguoiChtt: json["Nguoi_CHTT"],
    daiDienDvcs: json["DaiDienDVCS"],
    daiDienDoan: json["DaiDienDoan"],
    tpKt1: json["TP_KT1"],
    tpKt2: json["TP_KT2"],
    tpKtCs1: json["TP_KT_CS1"],
    tpKtCs2: json["TP_KT_CS2"],
    nguoiChiHuyTt: json["NguoiChiHuyTT"],
    nguoiGsat: json["NguoiGSAT"],
    kethuc: json["KetThuc"],
    cotontai: json["CoTonTai"],
    danhGiaY9: json["DanhGiaY9"],
    loaiktgs: json["Loai_KTGS"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "MA_PCT": maPct,
    "DonViId": donViId,
    "ID_PLV": idPlv,
    "DiaDiem": diaDiem,
    "ThoiGian": thoiGian,
    "DonViCoSo": donViCoSo,
    "NoiDungCongViec": noiDungCongViec,
    "DanhGiaY1": danhGiaY1,
    "DanhGiaY2": danhGiaY2,
    "DanhGiaY3": danhGiaY3,
    "DanhGiaY4": danhGiaY4,
    "DanhGiaY5": danhGiaY5,
    "DanhGiaY6": danhGiaY6,
    "DanhGiaY7": danhGiaY7,
    "DanhGiaY8": danhGiaY8,
    "Nguoi_CHTT": nguoiChtt,
    "DaiDienDVCS": daiDienDvcs,
    "DaiDienDoan": daiDienDoan,
    "TP_KT1": tpKt1,
    "TP_KT2": tpKt2,
    "TP_KT_CS1": tpKtCs1,
    "TP_KT_CS2": tpKtCs2,
    "NguoiChiHuyTT": nguoiChiHuyTt,
    "NguoiGSAT": nguoiGsat,
    "KetThuc": kethuc,
    "CoTonTai": cotontai,
  };
}
