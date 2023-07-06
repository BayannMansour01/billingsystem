// To parse this JSON data, do
//
//     final searchbillmodel = searchbillmodelFromJson(jsonString);

import 'dart:convert';

Searchbillmodel searchbillmodelFromJson(String str) =>
    Searchbillmodel.fromJson(json.decode(str));

String searchbillmodelToJson(Searchbillmodel data) =>
    json.encode(data.toJson());

class Searchbillmodel {
  Searchbillmodel({
    this.bills,
  });

  late List<BillSearced>? bills;

  factory Searchbillmodel.fromJson(Map<String, dynamic> json) =>
      Searchbillmodel(
        bills: List<BillSearced>.from(
            json["bills"].map((x) => BillSearced.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bills": List<dynamic>.from(bills!.map((x) => x.toJson())),
      };
}

class BillSearced {
  BillSearced({
    this.id,
    this.businessName,
    this.userName,
    this.billNumber,
    this.logo,
    this.dateOfCreate,
    this.dueDate,
    this.rateVat,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  late int? id;
  late String? businessName;
  late String? userName;
  late String? billNumber;
  late String? logo;
  late DateTime? dateOfCreate;
  late DateTime? dueDate;
  late String? rateVat;
  late String? status;
  late dynamic? deletedAt;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  factory BillSearced.fromJson(Map<String, dynamic> json) => BillSearced(
        id: json["id"],
        businessName: json["business_name"],
        userName: json["user_name"],
        billNumber: json["bill_number"],
        logo: json["logo"],
        dateOfCreate: DateTime.parse(json["date_of_create"]),
        dueDate: DateTime.parse(json["due_date"]),
        rateVat: json["rate_vat"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_name": businessName,
        "user_name": userName,
        "bill_number": billNumber,
        "logo": logo,
        "date_of_create": dateOfCreate!.toIso8601String(),
        "due_date":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "rate_vat": rateVat,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
