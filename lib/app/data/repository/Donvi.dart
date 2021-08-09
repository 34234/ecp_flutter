import 'dart:convert';

class Donvi {
  Donvi({
    this.maDviqly,
    this.tenDviqly,
    this.linkapi
  });
  String maDviqly;
  String tenDviqly;
  String linkapi;
  factory Donvi.fromJson(Map<String, dynamic> json) => Donvi(
    maDviqly: json["MA_DVIQLY"],
    tenDviqly: json["TEN_DVIQLY"],
    linkapi: json["LINKAPI"]
  );

  Map<String, dynamic> toJson() => {
    "MA_DVIQLY": maDviqly,
    "TEN_DVIQLY": tenDviqly,
    "LINKAPI": linkapi,
  };


}
 List<Donvi> LstDonviFromJson(dynamic data) => List<Donvi>.from(data.map((x) => Donvi.fromJson(x)));

 String LstDonviToJson(List<Donvi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




