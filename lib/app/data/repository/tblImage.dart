// To parse this JSON data, do
//
//     final tblImage = tblImageFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:ecp_mobile/app/data/repository/plv_Images.dart';
import 'package:ecp_mobile/app/data/repository/tblComment_Image.dart';

List<TblImage> ListTblImageFromJson(dynamic d) => List<TblImage>.from(d.map((x) => TblImage.fromJson(x)));

TblImage tblImageFromJson(String str) => TblImage.fromJson(json.decode(str));

String tblImageToJson(TblImage data) => json.encode(data.toJson());

class TblImage {
  TblImage({
    this.id,
    this.url,
    this.note,
    this.comment,
    this.tag,
    this.ngayCapNhat,
    this.groupId,
    this.phienLamViecId,
    this.userUp,
    this.isVideo,
    this.videoPath,
    this.kinhDo,
    this.viDo,
    this.ngayChup,
    this.imgSize,
    this.type,
    this.urlThumb,
    this.isDelete,
    this.nguoiXoa,
    this.ngayXoa,
    this.phieuLamViecImages,
    this.tblCommentImage,
    this.localFile,
    this.id_ktgs
  });

  int id;
  dynamic url;
  dynamic note;
  dynamic comment;
  dynamic tag;
  dynamic ngayCapNhat;
  dynamic groupId;
  dynamic phienLamViecId;
  dynamic userUp;
  dynamic isVideo;
  dynamic videoPath;
  dynamic kinhDo;
  dynamic viDo;
  dynamic ngayChup;
  dynamic imgSize;
  dynamic type;
  dynamic urlThumb;
  dynamic isDelete;
  dynamic nguoiXoa;
  dynamic ngayXoa;
  dynamic id_ktgs;
  File localFile;
  List<PlvImages> phieuLamViecImages;
  List<TblCommentImage> tblCommentImage;

  factory TblImage.fromJson(Map<String, dynamic> json) => TblImage(
    id: json["Id"],
    url: json["Url"],
    note: json["Note"],
    comment: json["Comment"],
    tag: json["Tag"],
    ngayCapNhat: json["NgayCapNhat"],
    groupId: json["GroupId"],
    phienLamViecId: json["PhienLamViecId"],
    userUp: json["UserUp"],
    isVideo: json["isVideo"],
    videoPath: json["VideoPath"],
    kinhDo: json["KinhDo"],
    viDo: json["ViDo"],
    ngayChup: json["NgayChup"],
    imgSize: json["ImgSize"],
    type: json["Type"],
    urlThumb: json["UrlThumb"],
    isDelete: json["IsDelete"],
    nguoiXoa: json["NguoiXoa"],
    ngayXoa: json["NgayXoa"],
    id_ktgs: json["ID_KTGS"],
    phieuLamViecImages: List<PlvImages>.from(json["PhieuLamViec_Images"].map((x) => x)),
    tblCommentImage: List<TblCommentImage>.from(json["tblComment_Image"].map((x) => TblCommentImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Url": url,
    "Note": note,
    "Comment": comment,
    "Tag": tag,
    "NgayCapNhat": ngayCapNhat.toIso8601String(),
    "GroupId": groupId,
    "PhienLamViecId": phienLamViecId,
    "UserUp": userUp,
    "isVideo": isVideo,
    "VideoPath": videoPath,
    "KinhDo": kinhDo,
    "ViDo": viDo,
    "NgayChup": ngayChup,
    "ImgSize": imgSize,
    "Type": type,
    "UrlThumb": urlThumb,
    "IsDelete": isDelete,
    "NguoiXoa": nguoiXoa,
    "NgayXoa": ngayXoa,
    "ID_KTGS": id_ktgs,
    "PhieuLamViec_Images": List<dynamic>.from(phieuLamViecImages.map((x) => x)),
    "tblComment_Image": List<dynamic>.from(tblCommentImage.map((x) => x)),
  };
}
