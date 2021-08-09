// To parse this JSON data, do
//
//     final phienLamViecDs = phienLamViecDsFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

PhienLamViecDs phienLamViecDsFromJson(String str) => PhienLamViecDs.fromJson(json.decode(str));

String phienLamViecDsToJson(PhienLamViecDs data) => json.encode(data.toJson());

class PhienLamViecDs {
  PhienLamViecDs({
    this.count,
    this.plv,
  });

  int count;
  List<Plv> plv;

  factory PhienLamViecDs.fromJson(Map<String, dynamic> json) => PhienLamViecDs(
    count: json["count"],
    plv: List<Plv>.from(json["plv"].map((x) => Plv.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "plv": List<dynamic>.from(plv.map((x) => x.toJson())),
  };
}
DateFormat dateformat= DateFormat("dd/MM/yyyy hh:ss");
class Plv {
  Plv({
    this.id,
    this.phongBanId,
    this.noiDung,
    this.diaDiem,
    this.ngayLamViec,
    this.gioBd,
    this.gioKt,
    this.nguoiDuyetSoPa,
    this.nguoiChiHuy,
    this.giamSatVien,
    this.nguoiKiemSoat,
    this.nguoiKiemTraPhieu,
    this.lanhDaoTrucBan,
    this.ngayTao,
    this.nguoiTao,
    this.ngaySua,
    this.nguoiSua,
    this.ttPhien,
    this.trangThai,
    this.nguoiDuyet,
    this.ngayDuyet,
    this.lyDoThayDoi,
    this.maPct,
    this.nguoiDuyetSoPaId,
    this.nguoiChiHuyId,
    this.giamSatVienId,
    this.nguoiKiemSoatId,
    this.nguoiKiemTraPhieuId,
    this.lanhDaoTrucBanId,
    this.donViId,
    this.isChuyenNpc,
    this.ngayDuyetNpc,
    this.nguoiDuyetNpc,
    this.ngayKetThuc,
    this.isKiemTra,
    this.ngayGioKt,
    this.kinhDo,
    this.viDo,
    this.nguoiKetThuc,
    this.isEndByWeb,
    this.lanhDaoCongViec,
    this.lanhDaoCongViecId,
    this.nguoiCapPhieu,
    this.nguoiCapPhieuId,
    this.phongBanIdCreate,
    this.dieuKienAnToan,
    this.ttPhienNavigation,
    this.trangThaiNavigation,
    this.tblComment,
    this.tblPhienLamViecTheoDoi,
    this.tblPhienLamViecThuocTinh,
    this.strgioBd,
    this.strgioKt,
    this.tenphongban,
    this.id_ktgs
  });

  int id;
  int phongBanId;
  String noiDung;
  String diaDiem;
  dynamic ngayLamViec;
  String strgioBd;
  String strgioKt;
  dynamic gioBd;
  dynamic gioKt;
  String nguoiDuyetSoPa;
  String nguoiChiHuy;
  String giamSatVien;
  String nguoiKiemSoat;
  String nguoiKiemTraPhieu;
  String lanhDaoTrucBan;
  dynamic ngayTao;
  String nguoiTao;
  dynamic ngaySua;
  dynamic nguoiSua;
  int ttPhien;
  int trangThai;
  String nguoiDuyet;
  dynamic ngayDuyet;
  String lyDoThayDoi;
  int maPct;
  String nguoiDuyetSoPaId;
  String nguoiChiHuyId;
  String giamSatVienId;
  String nguoiKiemSoatId;
  String nguoiKiemTraPhieuId;
  String lanhDaoTrucBanId;
  String donViId;
  bool isChuyenNpc;
  dynamic ngayDuyetNpc;
  String nguoiDuyetNpc;
  dynamic ngayKetThuc;
  dynamic isKiemTra;
  dynamic ngayGioKt;
  double kinhDo;
  double viDo;
  dynamic nguoiKetThuc;
  dynamic isEndByWeb;
  dynamic lanhDaoCongViec;
  dynamic lanhDaoCongViecId;
  dynamic nguoiCapPhieu;
  dynamic nguoiCapPhieuId;
  int phongBanIdCreate;
  dynamic dieuKienAnToan;
  dynamic ttPhienNavigation;
  dynamic trangThaiNavigation;
  List<dynamic> tblComment;
  List<dynamic> tblPhienLamViecTheoDoi;
  List<dynamic> tblPhienLamViecThuocTinh;
  dynamic tenphongban;
  dynamic id_ktgs;

  factory Plv.fromJson(Map<String, dynamic> json) => Plv(
    id: json["Id"],
    phongBanId: json["PhongBanID"],
    noiDung: json["NoiDung"],
    diaDiem: json["DiaDiem"],
    ngayLamViec: json["NgayLamViec"],
    gioBd: json["GioBd"],
    strgioBd: json["GioBd"]==null?"":dateformat.format(DateTime.parse(json["GioBd"])),
    gioKt: json["GioKt"],
    strgioKt: json["GioKt"]==null?"":dateformat.format(DateTime.parse(json["GioKt"])),
    nguoiDuyetSoPa: json["NguoiDuyet_SoPa"],
    nguoiChiHuy: json["NguoiChiHuy"]==null?"":json["NguoiChiHuy"],
    giamSatVien: json["GiamSatVien"],
    nguoiKiemSoat: json["NguoiKiemSoat"]==null?"":json["NguoiKiemSoat"],
    nguoiKiemTraPhieu: json["NguoiKiemTraPhieu"],
    lanhDaoTrucBan: json["LanhDaoTrucBan"],
    ngayTao:json["NgayTao"],
    nguoiTao: json["NguoiTao"],
    ngaySua: json["NgaySua"],
    nguoiSua: json["NguoiSua"],
    ttPhien: json["TT_Phien"],
    trangThai: json["TrangThai"],
    nguoiDuyet: json["NguoiDuyet"]==null?"":json["NguoiDuyet"],
    ngayDuyet: json["NgayDuyet"],
    lyDoThayDoi: json["LyDoThayDoi"],
    maPct: json["MaPCT"],
    nguoiDuyetSoPaId: json["NguoiDuyet_SoPa_Id"],
    nguoiChiHuyId: json["NguoiChiHuy_Id"]==null?"":json["NguoiChiHuy_Id"],
    giamSatVienId: json["GiamSatVien_Id"]==null?"":json["GiamSatVien_Id"],
    nguoiKiemSoatId: json["NguoiKiemSoat_Id"],
    nguoiKiemTraPhieuId: json["NguoiKiemTraPhieu_Id"],
    lanhDaoTrucBanId: json["LanhDaoTrucBan_Id"],
    donViId: json["DonViId"],
    isChuyenNpc: json["IsChuyenNPC"],
    ngayDuyetNpc:json["NgayDuyetNPC"],
    nguoiDuyetNpc: json["NguoiDuyetNPC"],
    ngayKetThuc: json["NgayKetThuc"],
    isKiemTra: json["IsKiemTra"],
    ngayGioKt: json["NgayGioKT"],
    kinhDo: json["KinhDo"],
    viDo: json["ViDo"],
    nguoiKetThuc: json["NguoiKetThuc"],
    isEndByWeb: json["IsEndByWeb"],
    lanhDaoCongViec: json["LanhDaoCongViec"],
    lanhDaoCongViecId: json["LanhDaoCongViec_Id"],
    nguoiCapPhieu: json["NguoiCapPhieu"],
    nguoiCapPhieuId: json["NguoiCapPhieu_Id"],
    phongBanIdCreate: json["PhongBanIDCreate"],
    dieuKienAnToan: json["DieuKienAnToan"],
    ttPhienNavigation: json["TT_PhienNavigation"],
    trangThaiNavigation: json["TrangThaiNavigation"],
    tenphongban: json["TEN_PHONG_BAN"],
    id_ktgs: json["ID_KTGS"],


    //tblComment: List<dynamic>.from(json["tblComment"].map((x) => x)),
    //tblPhienLamViecTheoDoi: List<dynamic>.from(json["tblPhienLamViec_TheoDoi"].map((x) => x)),
    //tblPhienLamViecThuocTinh: List<dynamic>.from(json["tblPhienLamViec_ThuocTinh"].map((x) => x)),


  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PhongBanID": phongBanId,
    "NoiDung": noiDung,
    "DiaDiem": diaDiem,
    "NgayLamViec": ngayLamViec.toIso8601String(),
    "GioBd": gioBd.toIso8601String(),
    "GioKt": gioKt.toIso8601String(),
    "NguoiDuyet_SoPa": nguoiDuyetSoPa,
    "NguoiChiHuy": nguoiChiHuy,
    "GiamSatVien": giamSatVien,
    "NguoiKiemSoat": nguoiKiemSoat,
    "NguoiKiemTraPhieu": nguoiKiemTraPhieu,
    "LanhDaoTrucBan": lanhDaoTrucBan,
    "NgayTao": ngayTao.toIso8601String(),
    "NguoiTao": nguoiTao,
    "NgaySua": ngaySua,
    "NguoiSua": nguoiSua,
    "TT_Phien": ttPhien,
    "TrangThai": trangThai,
    "NguoiDuyet": nguoiDuyet,
    "NgayDuyet": ngayDuyet.toIso8601String(),
    "LyDoThayDoi": lyDoThayDoi,
    "MaPCT": maPct,
    "NguoiDuyet_SoPa_Id": nguoiDuyetSoPaId,
    "NguoiChiHuy_Id": nguoiChiHuyId,
    "GiamSatVien_Id": giamSatVienId,
    "NguoiKiemSoat_Id": nguoiKiemSoatId,
    "NguoiKiemTraPhieu_Id": nguoiKiemTraPhieuId,
    "LanhDaoTrucBan_Id": lanhDaoTrucBanId,
    "DonViId": donViId,
    "IsChuyenNPC": isChuyenNpc,
    "NgayDuyetNPC": ngayDuyetNpc.toIso8601String(),
    "NguoiDuyetNPC": nguoiDuyetNpc,
    "NgayKetThuc": ngayKetThuc,
    "IsKiemTra": isKiemTra,
    "NgayGioKT": ngayGioKt,
    "KinhDo": kinhDo,
    "ViDo": viDo,
    "NguoiKetThuc": nguoiKetThuc,
    "IsEndByWeb": isEndByWeb,
    "LanhDaoCongViec": lanhDaoCongViec,
    "LanhDaoCongViec_Id": lanhDaoCongViecId,
    "NguoiCapPhieu": nguoiCapPhieu,
    "NguoiCapPhieu_Id": nguoiCapPhieuId,
    "PhongBanIDCreate": phongBanIdCreate,
    "DieuKienAnToan": dieuKienAnToan,
    "TT_PhienNavigation": ttPhienNavigation,
    "TrangThaiNavigation": trangThaiNavigation,
    "tblComment": List<dynamic>.from(tblComment.map((x) => x)),
    "tblPhienLamViec_TheoDoi": List<dynamic>.from(tblPhienLamViecTheoDoi.map((x) => x)),
    "tblPhienLamViec_ThuocTinh": List<dynamic>.from(tblPhienLamViecThuocTinh.map((x) => x)),
  };
}


class ResultSearch{
  ResultSearch({
  this.phongBanId,
  this.noiDung,
  this.tungay,
  this.denngay
  });
  var phongBanId;
  var noiDung;
  var tungay;
  var denngay;
}
