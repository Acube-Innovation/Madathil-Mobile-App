class AddClosingStatmentResponse {
  Data? data;

  AddClosingStatmentResponse({this.data});

  AddClosingStatmentResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  String? customerName;
  String? mobileNumber;
  String? selectBusiness;
  String? customerAddress;
  String? item;
  String? consumerNumber;
  double? itemMargin;
  String? kw;
  double? taxableValue;
  double? taxAmount;
  double? itemExpense;
  String? subsidycommercial;
  String? taxRate;
  double? totalValue;
  double? updatedItemMargin;
  String? closingDate;
  double? projectCost;
  double? discountAmount;
  double? commissionAmount;
  String? advanceAmountCollected;
  String? employeeId;
  String? designation;
  String? employeeName;
  String? zone;
  String? doctype;
  List<HolderDetails>? holderDetails;
  List<CommissionClosingShares>? commissionClosingShares;

  Data({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.idx,
    this.docstatus,
    this.customerName,
    this.mobileNumber,
    this.selectBusiness,
    this.customerAddress,
    this.item,
    this.consumerNumber,
    this.itemMargin,
    this.kw,
    this.taxableValue,
    this.taxAmount,
    this.itemExpense,
    this.subsidycommercial,
    this.taxRate,
    this.totalValue,
    this.updatedItemMargin,
    this.closingDate,
    this.projectCost,
    this.discountAmount,
    this.commissionAmount,
    this.advanceAmountCollected,
    this.employeeId,
    this.designation,
    this.employeeName,
    this.zone,
    this.doctype,
    this.holderDetails,
    this.commissionClosingShares,
  });

  Data.fromJson(Map<String, dynamic> json) {
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
    customerName = json['customer_name'];
    mobileNumber = json['mobile_number'];
    selectBusiness = json['select_business'];
    customerAddress = json['customer_address'];
    item = json['item'];
    consumerNumber = json['consumer_number'];
    itemMargin = json['item_margin']?.toDouble();
    kw = json['kw'];
    taxableValue = json['taxable_value']?.toDouble();
    taxAmount = json['tax_amount']?.toDouble();
    itemExpense = json['item_expense']?.toDouble();
    subsidycommercial = json['subsidycommercial'];
    taxRate = json['tax_rate'];
    totalValue = json['total_value']?.toDouble();
    updatedItemMargin = json['updated_item_margin']?.toDouble();
    closingDate = json['closing_date'];
    projectCost = json['project_cost']?.toDouble();
    discountAmount = json['discount_amount']?.toDouble();
    commissionAmount = json['commission_amount']?.toDouble();
    advanceAmountCollected = json['advance_amount_collected'];
    employeeId = json['employee_id'];
    designation = json['designation'];
    employeeName = json['employee_name'];
    zone = json['zone'];
    doctype = json['doctype'];
    
    // Handle holderDetails
    if (json['holder_details'] != null) {
      holderDetails = <HolderDetails>[];
      json['holder_details'].forEach((v) {
        holderDetails!.add(HolderDetails.fromJson(v));
      });
    }

    // Handle commissionClosingShares
    if (json['commission_closing_shares'] != null) {
      commissionClosingShares = <CommissionClosingShares>[];
      json['commission_closing_shares'].forEach((v) {
        commissionClosingShares!.add(CommissionClosingShares.fromJson(v));
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
    data['parent'] = this.parent;
    data['parentfield'] = this.parentfield;
    data['parenttype'] = this.parenttype;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['customer_name'] = this.customerName;
    data['mobile_number'] = this.mobileNumber;
    data['select_business'] = this.selectBusiness;
    data['customer_address'] = this.customerAddress;
    data['item'] = this.item;
    data['consumer_number'] = this.consumerNumber;
    data['item_margin'] = this.itemMargin;
    data['kw'] = this.kw;
    data['taxable_value'] = this.taxableValue;
    data['tax_amount'] = this.taxAmount;
    data['item_expense'] = this.itemExpense;
    data['subsidycommercial'] = this.subsidycommercial;
    data['tax_rate'] = this.taxRate;
    data['total_value'] = this.totalValue;
    data['updated_item_margin'] = this.updatedItemMargin;
    data['closing_date'] = this.closingDate;
    data['project_cost'] = this.projectCost;
    data['discount_amount'] = this.discountAmount;
    data['commission_amount'] = this.commissionAmount;
    data['advance_amount_collected'] = this.advanceAmountCollected;
    data['employee_id'] = this.employeeId;
    data['designation'] = this.designation;
    data['employee_name'] = this.employeeName;
    data['zone'] = this.zone;
    data['doctype'] = this.doctype;
    
    if (this.holderDetails != null) {
      data['holder_details'] =
          this.holderDetails!.map((v) => v.toJson()).toList();
    }
    
    if (this.commissionClosingShares != null) {
      data['commission_closing_shares'] =
          this.commissionClosingShares!.map((v) => v.toJson()).toList();
    }
    
    return data;
  }
}

class HolderDetails {
  // Add the necessary fields for HolderDetails
  HolderDetails.fromJson(Map<String, dynamic> json) {
    // Add parsing logic
  }

  Map<String, dynamic> toJson() {
    // Add serialization logic
    return {};
  }
}

class CommissionClosingShares {
  // Add the necessary fields for CommissionClosingShares
  CommissionClosingShares.fromJson(Map<String, dynamic> json) {
    // Add parsing logic
  }

  Map<String, dynamic> toJson() {
    // Add serialization logic
    return {};
  }
}
