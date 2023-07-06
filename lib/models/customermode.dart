// import 'dart:convert';

// UserDatacus userDatacusFromJson(String str) =>
//     UserDatacus.fromJson(json.decode(str));

// String userDatacusToJson(UserDatacus data) => json.encode(data.toJson());

// class UserDatacus {
//   UserDatacus({
//     this.data,
//   });

//   final Data? data;

//   factory UserDatacus.fromJson(Map<String, dynamic> json) => UserDatacus(
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data!.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.id,
//     this.email,
//     this.userName,
//     this.firstName,
//     this.lastName,
//     this.phoneNumber,
//   });

//   final int? id;
//   final String? email;
//   final String? userName;
//   final String? firstName;
//   final String? lastName;
//   final String? phoneNumber;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         email: json["email"],
//         userName: json["user_name"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         phoneNumber: json["phone_number"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "user_name": userName,
//         "first_name": firstName,
//         "last_name": lastName,
//         "phone_number": phoneNumber,
//       };
// }
