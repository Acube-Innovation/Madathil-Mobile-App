class MonthlySalaryListResponse {
  Message? message;

  MonthlySalaryListResponse({this.message});

  MonthlySalaryListResponse.fromJson(Map<String, dynamic> json) {
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
  List<Summary>? summary;

  Message({this.success, this.summary});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['summary'] != null) {
      summary = <Summary>[];
      json['summary'].forEach((v) {
        summary!.add(new Summary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.summary != null) {
      data['summary'] = this.summary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  String? month;
  String? monthString;
  int? points;
  int? salary;
  int? incentives;

  Summary(
      {this.month,
      this.monthString,
      this.points,
      this.salary,
      this.incentives});

  Summary.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    monthString = json['month_string'];
    points = json['points'];
    salary = json['salary'];
    incentives = json['incentives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['month_string'] = this.monthString;
    data['points'] = this.points;
    data['salary'] = this.salary;
    data['incentives'] = this.incentives;
    return data;
  }
}