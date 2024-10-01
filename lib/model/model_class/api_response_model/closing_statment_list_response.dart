class ClosingStatmentListResponse {
  List<ClosingStatmentList>? data;

  ClosingStatmentListResponse({this.data});

  ClosingStatmentListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClosingStatmentList>[];
      json['data'].forEach((v) {
        data!.add(ClosingStatmentList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClosingStatmentList {
  String? name;
  String? customerName;
  double? projectCost;
  String? closingDate;
  String? mobileNumber;
  String? selectBusiness;
  String? customerAddress;
  String? item; 
  String? kw;
  double? itemMargin;
  double? itemExpense;

  ClosingStatmentList({
    this.name,
    this.customerName,
    this.projectCost,
    this.closingDate,
    this.mobileNumber,
    this.selectBusiness,
    this.customerAddress,
    this.item,
    this.kw,
    this.itemMargin,
    this.itemExpense,
  });

  ClosingStatmentList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customerName = json['customer_name'];
    projectCost =
        (json['project_cost'] != null) ? json['project_cost'].toDouble() : null;
    closingDate = json['closing_date'];
    mobileNumber = json['mobile_number'];
    selectBusiness = json['select_business'];
    customerAddress = json['customer_address'];
    item = json['item']; 
    kw = json['kw'];
    itemMargin =
        (json['item_margin'] != null) ? json['item_margin'].toDouble() : null;
    itemExpense =
        (json['item_expense'] != null) ? json['item_expense'].toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['customer_name'] = this.customerName;
    data['project_cost'] = this.projectCost;
    data['closing_date'] = this.closingDate;
    data['mobile_number'] = this.mobileNumber;
    data['select_business'] = this.selectBusiness;
    data['customer_address'] = this.customerAddress;
    data['item'] = this.item;
    data['kw'] = this.kw;
    data['item_margin'] = this.itemMargin;
    data['item_expense'] = this.itemExpense;
    return data;
  }
}
