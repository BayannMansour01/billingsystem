// To parse this JSON data, do
//
//     final getrequestpending = getrequestpendingFromJson(jsonString);

import 'dart:convert';

Getrequestpending getrequestpendingFromJson(String str) =>
    Getrequestpending.fromJson(json.decode(str));

String getrequestpendingToJson(Getrequestpending data) =>
    json.encode(data.toJson());

class Getrequestpending {
  Getrequestpending({
    this.request,
  });

  final List<Request>? request;

  factory Getrequestpending.fromJson(Map<String, dynamic> json) =>
      Getrequestpending(
        request:
            List<Request>.from(json["Request"].map((x) => Request.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Request": List<dynamic>.from(request!.map((x) => x.toJson())),
      };
}

class Request {
  Request({
    this.id,
    this.adminId,
    this.costumerId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? adminId;
  final int? costumerId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        adminId: json["admin_id"],
        costumerId: json["costumer_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "costumer_id": costumerId,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
