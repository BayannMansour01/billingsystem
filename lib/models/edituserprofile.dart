import 'dart:convert';

Editprofileuser editprofileuserFromJson(String str) =>
    Editprofileuser.fromJson(json.decode(str));

String editprofileuserToJson(Editprofileuser data) =>
    json.encode(data.toJson());

class Editprofileuser {
  Editprofileuser({
    this.message,
    this.id,
  });

  final String? message;
  final int? id;

  factory Editprofileuser.fromJson(Map<String, dynamic> json) =>
      Editprofileuser(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}
