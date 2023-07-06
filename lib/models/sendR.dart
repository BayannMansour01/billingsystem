import 'dart:convert';

SendR sendRFromJson(String str) => SendR.fromJson(json.decode(str));

String sendRToJson(SendR data) => json.encode(data.toJson());

class SendR {
  SendR({
    this.message,
    this.id,
  });

  final String? message;
  final int? id;

  factory SendR.fromJson(Map<String, dynamic> json) =>
      SendR(message: json["message"], id: json["id"]);

  Map<String, dynamic> toJson() => {"message": message, "id": id};
}
