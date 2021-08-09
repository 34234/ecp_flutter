// To parse this JSON data, do
//
//     final plvImages = plvImagesFromJson(jsonString);

import 'dart:convert';

PlvImages plvImagesFromJson(String str) => PlvImages.fromJson(json.decode(str));

String plvImagesToJson(PlvImages data) => json.encode(data.toJson());

class PlvImages {
  PlvImages({
    this.id,
    this.maHa,
    this.maPct,
    this.maHaNavigation,
  });

  int id;
  dynamic maHa;
  dynamic maPct;
  dynamic maHaNavigation;

  factory PlvImages.fromJson(Map<String, dynamic> json) => PlvImages(
    id: json["ID"],
    maHa: json["MaHA"],
    maPct: json["MaPCT"],
    maHaNavigation: json["MaHANavigation"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "MaHA": maHa,
    "MaPCT": maPct,
    "MaHANavigation": maHaNavigation,
  };
}
