import 'dart:convert';

EditprofileAdmin editprofileAdminFromJson(String str) =>
    EditprofileAdmin.fromJson(json.decode(str));

String editprofileAdminToJson(EditprofileAdmin data) =>
    json.encode(data.toJson());

class EditprofileAdmin {
  EditprofileAdmin({
    this.message,
    this.id,
  });

  final String? message;
  final int? id;

  factory EditprofileAdmin.fromJson(Map<String, dynamic> json) =>
      EditprofileAdmin(
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
      };
}

class AdminData {
  AdminData({
    required this.id,
    required this.email,
    required this.businessName,
    required this.image,
    required this.city,
    required this.region,
    required this.phoneNumber,
  });

  int id;
  String email;
  String businessName;
  String image;
  String city;
  String region;
  String phoneNumber;

  factory AdminData.fromJson(Map<String, dynamic> json) => AdminData(
        id: json["id"],
        email: json["email"],
        businessName: json["business_name"],
        image: json["image"],
        city: json["city"],
        region: json["region"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "business_name": businessName,
        "image": image,
        "city": city,
        "region": region,
        "phone_number": phoneNumber,
      };
}
