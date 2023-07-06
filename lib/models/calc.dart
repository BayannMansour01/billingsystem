// To parse this JSON data, do
//
//     final calc = calcFromJson(jsonString);

import 'dart:convert';

Calc calcFromJson(String str) => Calc.fromJson(json.decode(str));

String calcToJson(Calc data) => json.encode(data.toJson());

class Calc {
  Calc({
    this.billNumber,
    this.subTotal,
    this.valueVat,
    this.totalPrice,
  });

  final String? billNumber;
  final String? subTotal;
  final double? valueVat;
  final double? totalPrice;

  factory Calc.fromJson(Map<String, dynamic> json) => Calc(
        billNumber: json["bill_number"],
        subTotal: json["subTotal"],
        valueVat: json["value_vat"].toDouble(),
        totalPrice: json["total price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "bill_number": billNumber,
        "subTotal": subTotal,
        "value_vat": valueVat,
        "total price": totalPrice,
      };
}
