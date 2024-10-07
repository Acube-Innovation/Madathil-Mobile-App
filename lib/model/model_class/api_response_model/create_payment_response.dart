class CreatePaymentResponse {
  PaymentMessage? message;

  CreatePaymentResponse({
    this.message,
  });

  factory CreatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      CreatePaymentResponse(
        message: PaymentMessage.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message!.toJson(),
      };
}

class PaymentMessage {
  bool? success;
  String? paymentEntry;

  PaymentMessage({
    this.success,
    this.paymentEntry,
  });

  factory PaymentMessage.fromJson(Map<String, dynamic> json) => PaymentMessage(
        success: json["success"],
        paymentEntry: json["payment_entry"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "payment_entry": paymentEntry,
      };
}
