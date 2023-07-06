// To parse this JSON data, do
//
//     final profileuser = profileuserFromJson(jsonString);

import 'dart:convert';

Profileuser profileuserFromJson(String str) =>
    Profileuser.fromJson(json.decode(str));

String profileuserToJson(Profileuser data) => json.encode(data.toJson());

class Profileuser {
  Profileuser({
    this.data,
  });

  final Data? data;

  factory Profileuser.fromJson(Map<String, dynamic> json) => Profileuser(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.userName,
  });

  final String? userName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
      };
}

// To parse this JSON data, do
//
//     final deleteprofileuser = deleteprofileuserFromJson(jsonString);

class Logoutmodelu {
  Logoutmodelu({
    this.message,
  });

  final String? message;

  factory Logoutmodelu.fromJson(Map<String, dynamic> json) => Logoutmodelu(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

Deleteprofileuser deleteprofileuserFromJson(String str) =>
    Deleteprofileuser.fromJson(json.decode(str));

String deleteprofileuserToJson(Deleteprofileuser data) =>
    json.encode(data.toJson());

class Deleteprofileuser {
  Deleteprofileuser({
    this.message,
    this.id,
  });

  final String? message;
  final int? id;

  factory Deleteprofileuser.fromJson(Map<String, dynamic> json) =>
      Deleteprofileuser(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}
