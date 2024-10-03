class GetPaymentMethod {
  List<PaymentMethod>? data;

  GetPaymentMethod({
    required this.data,
  });

  factory GetPaymentMethod.fromJson(Map<String, dynamic> json) =>
      GetPaymentMethod(
        data: List<PaymentMethod>.from(
            json["data"].map((x) => PaymentMethod.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PaymentMethod {
  String? name;

  PaymentMethod({
    this.name,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
