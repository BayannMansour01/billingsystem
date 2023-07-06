// To parse this JSON data, do
//
//     final addCustomer = addCustomerFromJson(jsonString);

import 'dart:convert';

AddCustomer addCustomerFromJson(String str) =>
    AddCustomer.fromJson(json.decode(str));

String addCustomerToJson(AddCustomer data) => json.encode(data.toJson());

class AddCustomer {
  AddCustomer({
    this.costumerProfiles,
  });

  final List<CostumerProfile>? costumerProfiles;

  factory AddCustomer.fromJson(Map<String, dynamic> json) => AddCustomer(
        costumerProfiles: List<CostumerProfile>.from(
            json["costumer_profiles"].map((x) => CostumerProfile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "costumer_profiles":
            List<dynamic>.from(costumerProfiles!.map((x) => x.toJson())),
      };
}

class CostumerProfile {
  CostumerProfile({
    this.id,
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? userId;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final int? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CostumerProfile.fromJson(Map<String, dynamic> json) =>
      CostumerProfile(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "active": active,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
