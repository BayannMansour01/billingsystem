// To parse this JSON data, do
//
//     final approve = approveFromJson(jsonString);

import 'dart:convert';

Approve approveFromJson(String str) => Approve.fromJson(json.decode(str));

String approveToJson(Approve data) => json.encode(data.toJson());

class Approve {
  Approve({
    this.message,
  });

  final String? message;

  factory Approve.fromJson(Map<String, dynamic> json) => Approve(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
