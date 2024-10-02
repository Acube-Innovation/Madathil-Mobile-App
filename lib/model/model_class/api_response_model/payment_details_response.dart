class PaymentDetailsResponse {
  PaymentDetails? data;

  PaymentDetailsResponse({this.data});

  PaymentDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? PaymentDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaymentDetails {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? namingSeries;
  String? paymentType;
  String? paymentOrderStatus;
  String? postingDate;
  String? company;
  String? partyType;
  String? party;
  String? partyName;
  double? partyBalance;
  String? paidFrom;
  String? paidFromAccountType;
  String? paidFromAccountCurrency;
  double? paidFromAccountBalance;
  String? paidTo;
  String? paidToAccountType;
  String? paidToAccountCurrency;
  double? paidToAccountBalance;
  double? paidAmount;
  double? paidAmountAfterTax;
  double? sourceExchangeRate;
  double? basePaidAmount;
  double? basePaidAmountAfterTax;
  double? receivedAmount;
  double? receivedAmountAfterTax;
  double? targetExchangeRate;
  double? baseReceivedAmount;
  double? baseReceivedAmountAfterTax;
  double? totalAllocatedAmount;
  double? baseTotalAllocatedAmount;
  double? unallocatedAmount;
  double? differenceAmount;
  int? applyTaxWithholdingAmount;
  double? baseTotalTaxesAndCharges;
  double? totalTaxesAndCharges;
  String? companyAddress;
  String? companyGstin;
  String? customerAddress;
  String? referenceNo;
  String? referenceDate;
  String? project;
  String? projectId;
  String? projectName;
  String? status;
  int? customRemarks;
  String? remarks;
  String? letterHead;
  String? title;
  int? projectReferencesOnly;
  String? doctype;
  List<Reference>? references;
  List<IncentivePayable>? incentivePayable;
  List<Tax>? taxes;
  List<Deduction>? deductions;

 PaymentDetails(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.idx,
      this.docstatus,
      this.namingSeries,
      this.paymentType,
      this.paymentOrderStatus,
      this.postingDate,
      this.company,
      this.partyType,
      this.party,
      this.partyName,
      this.partyBalance,
      this.paidFrom,
      this.paidFromAccountType,
      this.paidFromAccountCurrency,
      this.paidFromAccountBalance,
      this.paidTo,
      this.paidToAccountType,
      this.paidToAccountCurrency,
      this.paidToAccountBalance,
      this.paidAmount,
      this.paidAmountAfterTax,
      this.sourceExchangeRate,
      this.basePaidAmount,
      this.basePaidAmountAfterTax,
      this.receivedAmount,
      this.receivedAmountAfterTax,
      this.targetExchangeRate,
      this.baseReceivedAmount,
      this.baseReceivedAmountAfterTax,
      this.totalAllocatedAmount,
      this.baseTotalAllocatedAmount,
      this.unallocatedAmount,
      this.differenceAmount,
      this.applyTaxWithholdingAmount,
      this.baseTotalTaxesAndCharges,
      this.totalTaxesAndCharges,
      this.companyAddress,
      this.companyGstin,
      this.customerAddress,
      this.referenceNo,
      this.referenceDate,
      this.project,
      this.projectId,
      this.projectName,
      this.status,
      this.customRemarks,
      this.remarks,
      this.letterHead,
      this.title,
      this.projectReferencesOnly,
      this.doctype,
      this.references,
      this.incentivePayable,
      this.taxes,
      this.deductions});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    namingSeries = json['naming_series'];
    paymentType = json['payment_type'];
    paymentOrderStatus = json['payment_order_status'];
    postingDate = json['posting_date'];
    company = json['company'];
    partyType = json['party_type'];
    party = json['party'];
    partyName = json['party_name'];
    partyBalance = json['party_balance'];
    paidFrom = json['paid_from'];
    paidFromAccountType = json['paid_from_account_type'];
    paidFromAccountCurrency = json['paid_from_account_currency'];
    paidFromAccountBalance = json['paid_from_account_balance'];
    paidTo = json['paid_to'];
    paidToAccountType = json['paid_to_account_type'];
    paidToAccountCurrency = json['paid_to_account_currency'];
    paidToAccountBalance = json['paid_to_account_balance'];
    paidAmount = json['paid_amount'];
    paidAmountAfterTax = json['paid_amount_after_tax'];
    sourceExchangeRate = json['source_exchange_rate'];
    basePaidAmount = json['base_paid_amount'];
    basePaidAmountAfterTax = json['base_paid_amount_after_tax'];
    receivedAmount = json['received_amount'];
    receivedAmountAfterTax = json['received_amount_after_tax'];
    targetExchangeRate = json['target_exchange_rate'];
    baseReceivedAmount = json['base_received_amount'];
    baseReceivedAmountAfterTax = json['base_received_amount_after_tax'];
    totalAllocatedAmount = json['total_allocated_amount'];
    baseTotalAllocatedAmount = json['base_total_allocated_amount'];
    unallocatedAmount = json['unallocated_amount'];
    differenceAmount = json['difference_amount'];
    applyTaxWithholdingAmount = json['apply_tax_withholding_amount'];
    baseTotalTaxesAndCharges = json['base_total_taxes_and_charges'];
    totalTaxesAndCharges = json['total_taxes_and_charges'];
    companyAddress = json['company_address'];
    companyGstin = json['company_gstin'];
    customerAddress = json['customer_address'];
    referenceNo = json['reference_no'];
    referenceDate = json['reference_date'];
    project = json['project'];
    projectId = json['project_id'];
    projectName = json['project_name'];
    status = json['status'];
    customRemarks = json['custom_remarks'];
    remarks = json['remarks'];
    letterHead = json['letter_head'];
    title = json['title'];
    projectReferencesOnly = json['project_references_only'];
    doctype = json['doctype'];

    if (json['references'] != null) {
      references = <Reference>[];
      json['references'].forEach((v) {
        references!.add(Reference.fromJson(v));
      });
    }
    if (json['incentive_payable'] != null) {
      incentivePayable = <IncentivePayable>[];
      json['incentive_payable'].forEach((v) {
        incentivePayable!.add(IncentivePayable.fromJson(v));
      });
    }
    if (json['taxes'] != null) {
      taxes = <Tax>[];
      json['taxes'].forEach((v) {
        taxes!.add(Tax.fromJson(v));
      });
    }
    if (json['deductions'] != null) {
      deductions = <Deduction>[];
      json['deductions'].forEach((v) {
        deductions!.add(Deduction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['naming_series'] = this.namingSeries;
    data['payment_type'] = this.paymentType;
    data['payment_order_status'] = this.paymentOrderStatus;
    data['posting_date'] = this.postingDate;
    data['company'] = this.company;
    data['party_type'] = this.partyType;
    data['party'] = this.party;
    data['party_name'] = this.partyName;
    data['party_balance'] = this.partyBalance;
    data['paid_from'] = this.paidFrom;
    data['paid_from_account_type'] = this.paidFromAccountType;
    data['paid_from_account_currency'] = this.paidFromAccountCurrency;
    data['paid_from_account_balance'] = this.paidFromAccountBalance;
    data['paid_to'] = this.paidTo;
    data['paid_to_account_type'] = this.paidToAccountType;
    data['paid_to_account_currency'] = this.paidToAccountCurrency;
    data['paid_to_account_balance'] = this.paidToAccountBalance;
    data['paid_amount'] = this.paidAmount;
    data['paid_amount_after_tax'] = this.paidAmountAfterTax;
    data['source_exchange_rate'] = this.sourceExchangeRate;
    data['base_paid_amount'] = this.basePaidAmount;
    data['base_paid_amount_after_tax'] = this.basePaidAmountAfterTax;
    data['received_amount'] = this.receivedAmount;
    data['received_amount_after_tax'] = this.receivedAmountAfterTax;
    data['target_exchange_rate'] = this.targetExchangeRate;
    data['base_received_amount'] = this.baseReceivedAmount;
    data['base_received_amount_after_tax'] = this.baseReceivedAmountAfterTax;
    data['total_allocated_amount'] = this.totalAllocatedAmount;
    data['base_total_allocated_amount'] = this.baseTotalAllocatedAmount;
    data['unallocated_amount'] = this.unallocatedAmount;
    data['difference_amount'] = this.differenceAmount;
    data['apply_tax_withholding_amount'] = this.applyTaxWithholdingAmount;
    data['base_total_taxes_and_charges'] = this.baseTotalTaxesAndCharges;
    data['total_taxes_and_charges'] = this.totalTaxesAndCharges;
    data['company_address'] = this.companyAddress;
    data['company_gstin'] = this.companyGstin;
    data['customer_address'] = this.customerAddress;
    data['reference_no'] = this.referenceNo;
    data['reference_date'] = this.referenceDate;
    data['project'] = this.project;
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    data['status'] = this.status;
    data['custom_remarks'] = this.customRemarks;
    data['remarks'] = this.remarks;
    data['letter_head'] = this.letterHead;
    data['title'] = this.title;
    data['project_references_only'] = this.projectReferencesOnly;
    data['doctype'] = this.doctype;

    if (this.references != null) {
      data['references'] = this.references!.map((v) => v.toJson()).toList();
    }
    if (this.incentivePayable != null) {
      data['incentive_payable'] =
          this.incentivePayable!.map((v) => v.toJson()).toList();
    }
    if (this.taxes != null) {
      data['taxes'] = this.taxes!.map((v) => v.toJson()).toList();
    }
    if (this.deductions != null) {
      data['deductions'] = this.deductions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncentivePayable {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  String? parent;
  String? parentfield;
  String? parenttype;
  int? idx;
  int? docstatus;
  String? user;
  int? incentive;
  String? doctype;

  IncentivePayable(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.parent,
      this.parentfield,
      this.parenttype,
      this.idx,
      this.docstatus,
      this.user,
      this.incentive,
      this.doctype});

  IncentivePayable.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    user = json['user'];
    incentive = json['incentive'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['parent'] = this.parent;
    data['parentfield'] = this.parentfield;
    data['parenttype'] = this.parenttype;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['user'] = this.user;
    data['incentive'] = this.incentive;
    data['doctype'] = this.doctype;
    return data;
  }
}

class Reference {
  // Define the fields for the Reference class
  String? referenceId;
  String? referenceType;

  Reference({this.referenceId, this.referenceType});

  Reference.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    referenceType = json['reference_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference_id'] = this.referenceId;
    data['reference_type'] = this.referenceType;
    return data;
  }
}

class Tax {
  // Define the fields for the Tax class
  String? taxName;
  double? taxAmount;

  Tax({this.taxName, this.taxAmount});

  Tax.fromJson(Map<String, dynamic> json) {
    taxName = json['tax_name'];
    taxAmount = json['tax_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tax_name'] = this.taxName;
    data['tax_amount'] = this.taxAmount;
    return data;
  }
}

class Deduction {
  // Define the fields for the Deduction class
  String? deductionName;
  double? deductionAmount;

  Deduction({this.deductionName, this.deductionAmount});

  Deduction.fromJson(Map<String, dynamic> json) {
    deductionName = json['deduction_name'];
    deductionAmount = json['deduction_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deduction_name'] = this.deductionName;
    data['deduction_amount'] = this.deductionAmount;
    return data;
  }
}
