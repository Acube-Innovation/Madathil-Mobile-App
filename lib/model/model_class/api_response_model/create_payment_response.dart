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
  String? salesInvoice;

  PaymentMessage({this.success, this.paymentEntry, this.salesInvoice});

  factory PaymentMessage.fromJson(Map<String, dynamic> json) => PaymentMessage(
        success: json["success"],
        paymentEntry: json["payment_entry"],
        salesInvoice: json["sales_invoice"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "payment_entry": paymentEntry,
        "sales_invoice": salesInvoice,
      };
}
