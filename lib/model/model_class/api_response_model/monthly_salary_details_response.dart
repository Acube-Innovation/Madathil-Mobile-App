class MonthlySalaryDetailsResponse {
  Message? message;

  MonthlySalaryDetailsResponse({this.message});

  MonthlySalaryDetailsResponse.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  bool? success;
  String? monthString;
  int? totalPoints;
  int? totalSalary;
  int? totalIncentives;
  List<DetailedRows>? detailedRows;

  Message(
      {this.success,
      this.monthString,
      this.totalPoints,
      this.totalSalary,
      this.totalIncentives,
      this.detailedRows});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    monthString = json['month_string'];
    totalPoints = json['total_points'];
    totalSalary = json['total_salary'];
    totalIncentives = json['total_incentives'];
    if (json['detailed_rows'] != null) {
      detailedRows = <DetailedRows>[];
      json['detailed_rows'].forEach((v) {
        detailedRows!.add(new DetailedRows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['month_string'] = this.monthString;
    data['total_points'] = this.totalPoints;
    data['total_salary'] = this.totalSalary;
    data['total_incentives'] = this.totalIncentives;
    if (this.detailedRows != null) {
      data['detailed_rows'] =
          this.detailedRows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailedRows {
  String? closingStatement;
  String? customerName;
  String? item;
  double? projectCost;
  String? closingDate;
  int? points;
  double? salary;
  double? incentives;
  double? totalInvoiceAmount;
  double? totalPaidAmount;

  DetailedRows(
      {this.closingStatement,
      this.customerName,
      this.item,
      this.projectCost,
      this.closingDate,
      this.points,
      this.salary,
      this.incentives,
      this.totalInvoiceAmount,
      this.totalPaidAmount});

  DetailedRows.fromJson(Map<String, dynamic> json) {
    closingStatement = json['closing_statement'];
    customerName = json['customer_name'];
    item = json['item'];
    projectCost = json['project_cost'];
    closingDate = json['closing_date'];
    points = json['points'];
    salary = json['salary'];
    incentives = json['incentives'];
    totalInvoiceAmount = json['total_invoice_amount'];
    totalPaidAmount = json['paid_invoice_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['closing_statement'] = this.closingStatement;
    data['customer_name'] = this.customerName;
    data['item'] = this.item;
    data['project_cost'] = this.projectCost;
    data['closing_date'] = this.closingDate;
    data['points'] = this.points;
    data['salary'] = this.salary;
    data['incentives'] = this.incentives;
    data['total_invoice_amount'] = this.totalInvoiceAmount;
    data['paid_invoice_amount'] = this.totalPaidAmount;
    return data;
  }
}
