// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TblNhanVien TblNhanVienFromJson(String str) => TblNhanVien.fromJson(json.decode(str));

String TblNhanVienToJson(TblNhanVien data) => json.encode(data.toJson());

class TblNhanVien {
  TblNhanVien({
    this.id,
    this.tenNhanVien,
    this.chucVu,
    this.urlImage,
    this.bacHt,
    this.bacThi,
    this.bacAnToan,
    this.username,
    this.ngaySinh,
    this.diaChi,
    this.soDt,
    this.email,
    this.isCapPhieu,
    this.isLanhDaoCv,
    this.ischiHuyTt,
    this.isNguoiChoPhep,
    this.isGiamSatAt,
    this.isNguoiRaLenh,
    this.isThiHanhLenh,
    this.phongBanId,
    this.donViId,
    this.connectionId,
    this.ngayDangNhap,
    this.chuKySo,
    this.nhaMangSdt,
    this.password,
    this.disable,
  });

  dynamic id;
  dynamic tenNhanVien;
  dynamic chucVu;
  dynamic urlImage;
  dynamic bacHt;
  dynamic bacThi;
  dynamic bacAnToan;
  dynamic username;
  DateTime ngaySinh;
  dynamic diaChi;
  dynamic soDt;
  dynamic email;
  dynamic isCapPhieu;
  dynamic isLanhDaoCv;
  dynamic ischiHuyTt;
  dynamic isNguoiChoPhep;
  dynamic isGiamSatAt;
  dynamic isNguoiRaLenh;
  dynamic isThiHanhLenh;
  dynamic phongBanId;
  dynamic donViId;
  dynamic connectionId;
  dynamic ngayDangNhap;
  dynamic chuKySo;
  dynamic nhaMangSdt;
  dynamic password;
  dynamic disable;

  factory TblNhanVien.fromJson(Map<String, dynamic> json) => TblNhanVien(
    id: json["Id"],
    tenNhanVien: json["TenNhanVien"],
    chucVu: json["ChucVu"],
    urlImage: json["UrlImage"],
    bacHt: json["BacHT"],
    bacThi: json["BacThi"],
    bacAnToan: json["BacAnToan"],
    username: json["Username"],
    ngaySinh: json["NgaySinh"]==null?"":DateTime.parse(json["NgaySinh"]),
    diaChi: json["DiaChi"],
    soDt: json["SoDT"],
    email: json["Email"],
    isCapPhieu: json["IsCapPhieu"],
    isLanhDaoCv: json["IsLanhDaoCv"],
    ischiHuyTt: json["IschiHuyTT"],
    isNguoiChoPhep: json["IsNguoiChoPhep"],
    isGiamSatAt: json["IsGiamSatAT"],
    isNguoiRaLenh: json["IsNguoiRaLenh"],
    isThiHanhLenh: json["IsThiHanhLenh"],
    phongBanId: json["PhongBanId"],
    donViId: json["DonViId"],
    connectionId: json["ConnectionId"],
    ngayDangNhap: json["NgayDangNhap"],
    chuKySo: json["ChuKySo"],
    nhaMangSdt: json["NhaMangSDT"],
    password: json["Password"],
    disable: json["Disable"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "TenNhanVien": tenNhanVien,
    "ChucVu": chucVu,
    "UrlImage": urlImage,
    "BacHT": bacHt,
    "BacThi": bacThi,
    "BacAnToan": bacAnToan,
    "Username": username,
    "NgaySinh": ngaySinh.toIso8601String(),
    "DiaChi": diaChi,
    "SoDT": soDt,
    "Email": email,
    "IsCapPhieu": isCapPhieu,
    "IsLanhDaoCv": isLanhDaoCv,
    "IschiHuyTT": ischiHuyTt,
    "IsNguoiChoPhep": isNguoiChoPhep,
    "IsGiamSatAT": isGiamSatAt,
    "IsNguoiRaLenh": isNguoiRaLenh,
    "IsThiHanhLenh": isThiHanhLenh,
    "PhongBanId": phongBanId,
    "DonViId": donViId,
    "ConnectionId": connectionId,
    "NgayDangNhap": ngayDangNhap,
    "ChuKySo": chuKySo,
    "NhaMangSDT": nhaMangSdt,
    "Password": password,
    "Disable": disable,
  };
}
