class PaymentHistoryListResponse {
  List<PaymentHistoryList>? data;

  PaymentHistoryListResponse({this.data});

  PaymentHistoryListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PaymentHistoryList>[];
      json['data'].forEach((v) {
        data!.add(new PaymentHistoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentHistoryList {
  String? name;
  String? partyName;
  String? party;
  String? partyType;
  String? postingDate;
  double? paidAmount;
  String? referenceNo;
  String? paidToAccountType;
  String? paidFromAccountType;
  String? modeOfPayment;
  String? status;

  PaymentHistoryList(
      {this.name,
      this.partyName,
      this.party,
      this.partyType,
      this.postingDate,
      this.paidAmount,
      this.referenceNo,
      this.paidToAccountType,
      this.paidFromAccountType,
      this.modeOfPayment,
      this.status});

  PaymentHistoryList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    partyName = json['party_name'];
    party = json['party'];
    partyType = json['party_type'];
    postingDate = json['posting_date'];
    paidAmount = json['paid_amount'];
    referenceNo = json['reference_no'];
    paidToAccountType = json['paid_to_account_type'];
    paidFromAccountType = json['paid_from_account_type'];
    modeOfPayment = json['mode_of_payment'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['party_name'] = this.partyName;
    data['party'] = this.party;
    data['party_type'] = this.partyType;
    data['posting_date'] = this.postingDate;
    data['paid_amount'] = this.paidAmount;
    data['reference_no'] = this.referenceNo;
    data['paid_to_account_type'] = this.paidToAccountType;
    data['paid_from_account_type'] = this.paidFromAccountType;
    data['mode_of_payment'] = this.modeOfPayment;
    data['status'] = this.status;
    return data;
  }
}
