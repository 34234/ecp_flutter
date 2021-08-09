import 'dart:convert';

TblGroupImage tblGroupImageFromJson(String str) => TblGroupImage.fromJson(json.decode(str));

String tblGroupImageToJson(TblGroupImage data) => json.encode(data.toJson());

class TblGroupImage {
  TblGroupImage({
    this.id,
    this.noiDung,
    this.moTa,
    this.thuTu,
  });

  int id;
  dynamic noiDung;
  dynamic moTa;
  int thuTu;

  factory TblGroupImage.fromJson(Map<String, dynamic> json) => TblGroupImage(
    id: json["Id"],
    noiDung: json["NoiDung"],
    moTa: json["MoTa"],
    thuTu: json["ThuTu"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NoiDung": noiDung,
    "MoTa": moTa,
    "ThuTu": thuTu,
  };
}

class GroupImage{
  static int SO_PAN_THUC_HIEN=1;
  static int BUOC1=2;
  static int BUOC2=3;
  static int BUOC3=4;
  static int KHONG_XAC_DINH=5;
}