// To parse this JSON data, do
//
//     final createorder = createorderFromJson(jsonString);

import 'dart:convert';

Createorder createorderFromJson(String str) =>
    Createorder.fromJson(json.decode(str));

String createorderToJson(Createorder data) => json.encode(data.toJson());

class Createorder {
  Createorder({
    this.message,
    this.id,
    this.total,
  });

  final String? message;
  final int? id;
  final int? total;

  factory Createorder.fromJson(Map<String, dynamic> json) => Createorder(
        message: json["message"],
        id: json["id"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
        "total": total,
      };
}
