class TransactionInvoiceListResponse {
  List<TransactionInvoiceData>? data;

  TransactionInvoiceListResponse({this.data});

  // Factory method for JSON deserialization
  factory TransactionInvoiceListResponse.fromJson(Map<String, dynamic> json) {
    return TransactionInvoiceListResponse(
      data: json['data'] != null
          ? List<TransactionInvoiceData>.from(json['data'].map((v) => TransactionInvoiceData.fromJson(v)))
          : null,
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      if (data != null)
        'data': data!.map((v) => v.toJson()).toList(),
    };
  }
}

class TransactionInvoiceData {
  String? partyName;
  String? party;
  String? partyType;
  String? postingDate;
  double? paidAmount; // Changed to double to handle both int and double
  String? referenceNo;
  String? paidToAccountType;
  String? paidFromAccountType;
  String? modeOfPayment;
  String? status;

  TransactionInvoiceData({
    this.partyName,
    this.party,
    this.partyType,
    this.postingDate,
    this.paidAmount,
    this.referenceNo,
    this.paidToAccountType,
    this.paidFromAccountType,
    this.modeOfPayment,
    this.status,
  });

  // Factory method for JSON deserialization
  factory TransactionInvoiceData.fromJson(Map<String, dynamic> json) {
    return TransactionInvoiceData(
      partyName: json['party_name'] as String?,
      party: json['party'] as String?,
      partyType: json['party_type'] as String?,
      postingDate: json['posting_date'] as String?,
      // Convert paidAmount to double to handle both int and double
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      referenceNo: json['reference_no'] as String?,
      paidToAccountType: json['paid_to_account_type'] as String?,
      paidFromAccountType: json['paid_from_account_type'] as String?,
      modeOfPayment: json['mode_of_payment'] as String?,
      status: json['status'] as String?,
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'party_name': partyName,
      'party': party,
      'party_type': partyType,
      'posting_date': postingDate,
      'paid_amount': paidAmount,
      'reference_no': referenceNo,
      'paid_to_account_type': paidToAccountType,
      'paid_from_account_type': paidFromAccountType,
      'mode_of_payment': modeOfPayment,
      'status': status,
    };
  }
}
