class PointListResponse {
  PointsMessage? message;

  PointListResponse({this.message});

  PointListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null
        ? PointsMessage.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class PointsMessage {
  String? user;
  double? totalPoints;
  List<ClosingStatements>? closingStatements;

  PointsMessage({this.user, this.totalPoints, this.closingStatements});

  PointsMessage.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    totalPoints = json['total_points']?.toDouble();  // Convert to double
    if (json['closing_statements'] != null) {
      closingStatements = <ClosingStatements>[];
      json['closing_statements'].forEach((v) {
        closingStatements!.add(ClosingStatements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['total_points'] = totalPoints;
    if (closingStatements != null) {
      data['closing_statements'] =
          closingStatements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClosingStatements {
  String? name;
  String? customerName;
  String? selectBusiness;
  String? item;
  String? closingDate;
  double? holderPoints;
  double? commissionPoints;

  ClosingStatements(
      {this.name,
      this.customerName,
      this.selectBusiness,
      this.item,
      this.closingDate,
      this.holderPoints,
      this.commissionPoints});

  ClosingStatements.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customerName = json['customer_name'];
    selectBusiness = json['select_business'];
    item = json['item'];
    closingDate = json['closing_date'];
    holderPoints = json['holder_points']?.toDouble();  // Convert to double
    commissionPoints = json['commission_points']?.toDouble();  // Convert to double
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['customer_name'] = customerName;
    data['select_business'] = selectBusiness;
    data['item'] = item;
    data['closing_date'] = closingDate;
    data['holder_points'] = holderPoints;
    data['commission_points'] = commissionPoints;
    return data;
  }
}
