import 'dart:convert';

Sendinvres sendinvresFromJson(String str) =>
    Sendinvres.fromJson(json.decode(str));

String sendinvresToJson(Sendinvres data) => json.encode(data.toJson());

class Sendinvres {
  Sendinvres({
    this.massage,
    this.invoiceId,
  });

  final String? massage;
  final String? invoiceId;

  factory Sendinvres.fromJson(Map<String, dynamic> json) => Sendinvres(
        massage: json["massage"],
        invoiceId: json["invoice_id"],
      );

  Map<String, dynamic> toJson() => {
        "massage": massage,
        "invoice_id": invoiceId,
      };
}
