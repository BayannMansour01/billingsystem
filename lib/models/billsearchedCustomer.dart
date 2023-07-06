// To parse this JSON data, do
//
//     final searchCus = searchCusFromJson(jsonString);

import 'dart:convert';

SearchCusModel searchCusFromJson(String str) =>
    SearchCusModel.fromJson(json.decode(str));

String searchCusToJson(SearchCusModel data) => json.encode(data.toJson());

class SearchCusModel {
  SearchCusModel({
    this.bills,
  });

  final List<BillCustData>? bills;

  factory SearchCusModel.fromJson(Map<String, dynamic> json) => SearchCusModel(
        bills: List<BillCustData>.from(
            json["bills"].map((x) => BillCustData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bills": List<dynamic>.from(bills!.map((x) => x.toJson())),
      };
}

class BillCustData {
  BillCustData({
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
    this.pivot,
  });

  final int? id;
  final String? businessName;
  final String? userName;
  final String? billNumber;
  final String? logo;
  final DateTime? dateOfCreate;
  final DateTime? dueDate;
  final String? rateVat;
  final String? status;
  final dynamic? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  factory BillCustData.fromJson(Map<String, dynamic> json) => BillCustData(
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
        pivot: Pivot.fromJson(json["pivot"]),
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
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.billId,
  });

  final int? userId;
  final int? billId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        billId: json["bill_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "bill_id": billId,
      };
}
