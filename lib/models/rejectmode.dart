// To parse this JSON data, do
//
//     final reject = rejectFromJson(jsonString);

import 'dart:convert';

Reject rejectFromJson(String str) => Reject.fromJson(json.decode(str));

String rejectToJson(Reject data) => json.encode(data.toJson());

class Reject {
  Reject({
    this.message,
  });

  final String? message;

  factory Reject.fromJson(Map<String, dynamic> json) => Reject(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
