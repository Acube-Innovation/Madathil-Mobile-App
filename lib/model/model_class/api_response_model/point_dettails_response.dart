class PointDetailsResponse {
  List<PointDetailsMessage>? message;

  PointDetailsResponse({this.message});

  PointDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <PointDetailsMessage>[];
      json['message'].forEach((v) {
        message!.add(PointDetailsMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PointDetailsMessage {
  String? name;
  String? customerName;
  String? selectBusiness;
  String? consumerNumber;
  String? item;
  double? projectCost;
  String? closingDate;
  double? holderPoints;
  double? commissionPoints;

  PointDetailsMessage({
    this.name,
    this.customerName,
    this.selectBusiness,
    this.consumerNumber,
    this.item,
    this.projectCost,
    this.closingDate,
    this.holderPoints,
    this.commissionPoints,
  });

  PointDetailsMessage.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customerName = json['customer_name'];
    selectBusiness = json['select_business'];
    consumerNumber = json['consumer_number'];
    item = json['item'];
    projectCost = (json['project_cost'] as num?)?.toDouble();
    closingDate = json['closing_date'];
    holderPoints = (json['holder_points'] as num?)?.toDouble();
    commissionPoints = (json['commission_points'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['customer_name'] = customerName;
    data['select_business'] = selectBusiness;
    data['consumer_number'] = consumerNumber;
    data['item'] = item;
    data['project_cost'] = projectCost;
    data['closing_date'] = closingDate;
    data['holder_points'] = holderPoints;
    data['commission_points'] = commissionPoints;
    return data;
  }
}
