class billingSystemModel {
  String? access_token;
  String? token_type;
  Message? message;
  //messageData? data;
  // billingSystemModel({this.access_token,this.messege,this.token_type});
  billingSystemModel.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }
}

class Message {
  Message({
    required this.email,
    required this.password,
    required this.roleId,
  });

  List<String> email;
  List<String> password;
  List<String> roleId;

  factory Message.fromJson(json) => Message(
        email: List<String>.from(json["email"]),
        password: List<String>.from(json["password"]),
        roleId: List<String>.from(json["role_id"]),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email),
        "password": List<dynamic>.from(password),
        "role_id": List<dynamic>.from(roleId),
      };
}

class messageData {
  String? email;
  String? password;
  String? confirmpassword;
  String? roleid;
  //userData({this.email, this.password, this.confirmpassword);

  messageData.fromJson(json) {
    email = json['email'] ?? null;
    password = json['password'] ?? null;
    confirmpassword = json['password_confirmation'] ?? null;
    roleid = json['role_id'] ?? null;
  }
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

class customerData {
  customerData({
    this.id,
    this.email,
    this.userName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  int? id;
  String? email;
  String? userName;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  factory customerData.fromJson(Map<String, dynamic> json) => customerData(
        id: json["id"],
        email: json["email"],
        userName: json["user_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
      };
}
