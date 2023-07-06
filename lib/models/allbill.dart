// To parse this JSON data, do
//
//     final billmodel = billmodelFromJson(jsonString);

import 'dart:convert';

Billmodel billmodelFromJson(String str) => Billmodel.fromJson(json.decode(str));

String billmodelToJson(Billmodel data) => json.encode(data.toJson());

class Billmodel {
  Billmodel({
    this.data,
  });

  final List<BillmodelDatum>? data;

  factory Billmodel.fromJson(json) => Billmodel(
        data: List<BillmodelDatum>.from(
            json["data"].map((x) => BillmodelDatum.fromJson(x))).toList(),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BillmodelDatum {
  BillmodelDatum({
    this.id,
    this.billNumber,
    this.userName,
    this.businessName,
    this.logo,
    this.dateOfCreate,
    this.dueDate,
    this.subTotal,
    this.rateVat,
    this.valueVat,
    this.totalPrice,
    this.status,
    this.orders,
  });

  final int? id;
  final String? billNumber;
  final String? userName;
  final String? businessName;
  final String? logo;
  final DateTime? dateOfCreate;
  final DateTime? dueDate;
  final String? subTotal;
  final String? rateVat;
  final String? valueVat;
  final String? totalPrice;
  final String? status;
  final Orders? orders;

  factory BillmodelDatum.fromJson(Map<String, dynamic> json) => BillmodelDatum(
        id: json["id"],
        billNumber: json["bill_number"],
        userName: json["user_name"],
        businessName: json["business_name"],
        logo: json["logo"],
        dateOfCreate: DateTime.parse(json["date_of_create"]),
        dueDate: DateTime.parse(json["due_date"]),
        subTotal: json["subTotal"],
        rateVat: json["rate_vat"],
        valueVat: json["value_vat"],
        totalPrice: json["totalPrice"],
        status: json["status"],
        orders: Orders.fromJson(json["Orders"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bill_number": billNumber,
        "user_name": userName,
        "business_name": businessName,
        "logo": logo,
        "date_of_create": dateOfCreate!.toIso8601String(),
        "due_date":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "subTotal": subTotal,
        "rate_vat": rateVat,
        "value_vat": valueVat,
        "totalPrice": totalPrice,
        "status": status,
        "Orders": orders!.toJson(),
      };
}

class Orders {
  Orders({
    this.data,
  });

  List<OrdersDatum>? data;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        data: List<OrdersDatum>.from(
            json["data"].map((x) => OrdersDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrdersDatum {
  OrdersDatum({
    required this.id,
    required this.product,
    required this.quantity,
    required this.priceOne,
    required this.total,
  });

  final int? id;
  final String? product;
  final int? quantity;
  final String? priceOne;
  final String? total;

  factory OrdersDatum.fromJson(Map<String, dynamic> json) => OrdersDatum(
        id: json["id"],
        product: json["product"],
        quantity: json["quantity"],
        priceOne: json["price_one"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "quantity": quantity,
        "price_one": priceOne,
        "total": total,
      };
}
