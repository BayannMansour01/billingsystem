// To parse this JSON data, do
//
//     final profileAdmin = profileAdminFromJson(jsonString);

import 'dart:convert';

//ProfileAdmin profileAdminFromJson(String str) => ProfileAdmin.fromJson(json.decode(str));

//String profileAdminToJson(ProfileAdmin data) => json.encode(data.toJson());

class ProfileAdmin {
  ProfileAdmin({
    this.data,
  });

  final Data? data;

  factory ProfileAdmin.fromJson(Map<String, dynamic> json) => ProfileAdmin(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.businessName,
    this.image,
  });

  final String? businessName;
  final dynamic? image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        businessName: json["business_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "image": image,
      };
}

Logoutmodel logoutmodelFromJson(String str) =>
    Logoutmodel.fromJson(json.decode(str));

String logoutmodelToJson(Logoutmodel data) => json.encode(data.toJson());

class Logoutmodel {
  Logoutmodel({
    this.message,
  });

  final String? message;

  factory Logoutmodel.fromJson(Map<String, dynamic> json) => Logoutmodel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

DeleteprofileAdmin deleteprofileAdminFromJson(String str) =>
    DeleteprofileAdmin.fromJson(json.decode(str));

String deleteprofileAdminToJson(DeleteprofileAdmin data) =>
    json.encode(data.toJson());

class DeleteprofileAdmin {
  DeleteprofileAdmin({
    this.message,
    this.id,
  });

  final String? message;
  final int? id;

  factory DeleteprofileAdmin.fromJson(Map<String, dynamic> json) =>
      DeleteprofileAdmin(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}
