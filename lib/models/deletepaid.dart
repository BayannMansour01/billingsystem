// To parse this JSON data, do
//
//     final deletepaidbill = deletepaidbillFromJson(jsonString);

import 'dart:convert';

Deletepaidbill deletepaidbillFromJson(String str) =>
    Deletepaidbill.fromJson(json.decode(str));

String deletepaidbillToJson(Deletepaidbill data) => json.encode(data.toJson());

class Deletepaidbill {
  Deletepaidbill({
    this.message,
    this.id,
  });

  final String? message;
  final String? id;

  factory Deletepaidbill.fromJson(Map<String, dynamic> json) => Deletepaidbill(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}
