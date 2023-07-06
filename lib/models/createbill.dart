import 'dart:convert';

Createbill createbillFromJson(String str) =>
    Createbill.fromJson(json.decode(str));

String createbillToJson(Createbill data) => json.encode(data.toJson());

class Createbill {
  Createbill({
    this.message,
    this.billid,
  });

  final String? message;
  final int? billid;

  factory Createbill.fromJson(Map<String, dynamic> json) => Createbill(
        message: json["message"],
        billid: json["bill_id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "bill_id": billid,
      };
}
