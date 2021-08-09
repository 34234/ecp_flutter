// To parse this JSON data, do
//
//     final tblCommentImage = tblCommentImageFromJson(jsonString);

import 'dart:convert';

TblCommentImage tblCommentImageFromJson(String str) => TblCommentImage.fromJson(json.decode(str));

String tblCommentImageToJson(TblCommentImage data) => json.encode(data.toJson());

class TblCommentImage {
  TblCommentImage({
    this.id,
    this.commentContent,
    this.createTime,
    this.username,
    this.priority,
    this.description,
    this.imageId,
    this.image,
  });

  int id;
  dynamic commentContent;
  DateTime createTime;
  dynamic username;
  int priority;
  dynamic description;
  dynamic imageId;
  dynamic image;

  factory TblCommentImage.fromJson(Map<String, dynamic> json) => TblCommentImage(
    id: json["Id"],
    commentContent: json["CommentContent"],
    createTime: DateTime.parse(json["CreateTime"]),
    username: json["Username"],
    priority: json["Priority"],
    description: json["Description"],
    imageId: json["ImageId"],
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CommentContent": commentContent,
    "CreateTime": createTime.toIso8601String(),
    "Username": username,
    "Priority": priority,
    "Description": description,
    "ImageId": imageId,
    "Image": image,
  };
}
