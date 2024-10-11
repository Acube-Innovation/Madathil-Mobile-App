class MonthlyPaymentsDetailsResponse {
  MonthlyPaymentsDetailsMessage? message;

  MonthlyPaymentsDetailsResponse({this.message});

  factory MonthlyPaymentsDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MonthlyPaymentsDetailsResponse(
      message: json['message'] != null
          ? MonthlyPaymentsDetailsMessage.fromJson(json['message'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class MonthlyPaymentsDetailsMessage {
  bool? success;
  String? monthString;
  List<Payments>? payments;

  MonthlyPaymentsDetailsMessage({this.success, this.monthString, this.payments});

  factory MonthlyPaymentsDetailsMessage.fromJson(Map<String, dynamic> json) {
    return MonthlyPaymentsDetailsMessage(
      success: json['success'],
      monthString: json['month_string'],
      payments: json['payments'] != null
          ? (json['payments'] as List)
              .map((v) => Payments.fromJson(v))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['month_string'] = monthString;
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  String? paymentEntryId;
  String? postingDate;
  double? paidAmount; // Changed from int to double for better precision
  String? modeOfPayment;
  String? remarks;

  Payments(
      {this.paymentEntryId,
      this.postingDate,
      this.paidAmount,
      this.modeOfPayment,
      this.remarks});

  factory Payments.fromJson(Map<String, dynamic> json) {
    return Payments(
      paymentEntryId: json['payment_entry_id'],
      postingDate: json['posting_date'],
      paidAmount: json['paid_amount']?.toDouble(), // Ensures correct type conversion
      modeOfPayment: json['mode_of_payment'],
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_entry_id'] = paymentEntryId;
    data['posting_date'] = postingDate;
    data['paid_amount'] = paidAmount;
    data['mode_of_payment'] = modeOfPayment;
    data['remarks'] = remarks;
    return data;
  }
}
