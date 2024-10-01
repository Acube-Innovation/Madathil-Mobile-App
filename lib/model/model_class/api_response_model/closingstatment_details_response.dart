class ClosingStatmentDetailsResponse {
  ClosingStatementDetails? data;

  ClosingStatmentDetailsResponse({this.data});

  ClosingStatmentDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? ClosingStatementDetails.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ClosingStatementDetails {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? customerName;
  String? mobileNumber;
  String? selectBusiness;
  String? customerAddress;
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
  String? employeeId;
  String? designation;
  String? employeeName;
  String? doctype;
  List<HolderDetails>? holderDetails;
  List<dynamic>? commissionClosingShares;

  ClosingStatementDetails(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.idx,
      this.docstatus,
      this.customerName,
      this.mobileNumber,
      this.selectBusiness,
      this.customerAddress,
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
      this.employeeId,
      this.designation,
      this.employeeName,
      this.doctype,
      this.holderDetails,
      this.commissionClosingShares});

  ClosingStatementDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    customerName = json['customer_name'];
    mobileNumber = json['mobile_number'];
    selectBusiness = json['select_business'];
    customerAddress = json['customer_address'];
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
    employeeId = json['employee_id'];
    designation = json['designation'];
    employeeName = json['employee_name'];
    doctype = json['doctype'];
    if (json['holder_details'] != null) {
      holderDetails = <HolderDetails>[];
      json['holder_details'].forEach((v) {
        holderDetails!.add(HolderDetails.fromJson(v));
      });
    }
    if (json['commission_closing_shares'] != null) {
      commissionClosingShares = <dynamic>[];
      json['commission_closing_shares'].forEach((v) {
        commissionClosingShares!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['idx'] = idx;
    data['docstatus'] = docstatus;
    data['customer_name'] = customerName;
    data['mobile_number'] = mobileNumber;
    data['select_business'] = selectBusiness;
    data['customer_address'] = customerAddress;
    data['consumer_number'] = consumerNumber;
    data['item_margin'] = itemMargin;
    data['kw'] = kw;
    data['taxable_value'] = taxableValue;
    data['tax_amount'] = taxAmount;
    data['item_expense'] = itemExpense;
    data['subsidycommercial'] = subsidycommercial;
    data['tax_rate'] = taxRate;
    data['total_value'] = totalValue;
    data['updated_item_margin'] = updatedItemMargin;
    data['closing_date'] = closingDate;
    data['project_cost'] = projectCost;
    data['discount_amount'] = discountAmount;
    data['commission_amount'] = commissionAmount;
    data['employee_id'] = employeeId;
    data['designation'] = designation;
    data['employee_name'] = employeeName;
    data['doctype'] = doctype;
    if (holderDetails != null) {
      data['holder_details'] =
          holderDetails!.map((v) => v.toJson()).toList();
    }
    if (commissionClosingShares != null) {
      data['commission_closing_shares'] =
          commissionClosingShares!.map((v) => v).toList();
    }
    return data;
  }
}

class HolderDetails {
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
  String? holderDesignation;
  String? holderEmpid;
  String? holderEmpname;
  String? user;
  double? amount;
  double? percentage;
  String? points;
  String? doctype;

  HolderDetails(
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
      this.holderDesignation,
      this.holderEmpid,
      this.holderEmpname,
      this.user,
      this.amount,
      this.percentage,
      this.points,
      this.doctype});

  HolderDetails.fromJson(Map<String, dynamic> json) {
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
    holderDesignation = json['holder_designation'];
    holderEmpid = json['holder_empid'];
    holderEmpname = json['holder_empname'];
    user = json['user'];
    amount = json['amount']?.toDouble();
    percentage = json['percentage']?.toDouble();
    points = json['points'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['idx'] = idx;
    data['docstatus'] = docstatus;
    data['holder_designation'] = holderDesignation;
    data['holder_empid'] = holderEmpid;
    data['holder_empname'] = holderEmpname;
    data['user'] = user;
    data['amount'] = amount;
    data['percentage'] = percentage;
    data['points'] = points;
    data['doctype'] = doctype;
    return data;
  }
}
