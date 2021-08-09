import 'dart:convert';

Roles rolesFromJson(String str) => Roles.fromJson(json.decode(str));

String rolesToJson(Roles data) => json.encode(data.toJson());

class Roles {
  Roles({
    this.id,
    this.name,
    this.discriminator,
    this.description,
    this.typeOfRole,
  });

  dynamic id;
  dynamic name;
  dynamic discriminator;
  dynamic description;
  dynamic typeOfRole;

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
    id: json["Id"],
    name: json["Name"],
    discriminator: json["Discriminator"],
    description: json["Description"],
    typeOfRole: json["TypeOfRole"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Discriminator": discriminator,
    "Description": description,
    "TypeOfRole": typeOfRole,
  };
}