class MonthlyPaymentsResponse {
  MonthlyPaymentsMessage? message;

  MonthlyPaymentsResponse({this.message});

  factory MonthlyPaymentsResponse.fromJson(Map<String, dynamic> json) {
    return MonthlyPaymentsResponse(
      message: json['message'] != null ? MonthlyPaymentsMessage.fromJson(json['message']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class MonthlyPaymentsMessage {
  bool? success;
  List<MonthlySalarySummary>? monthlySalarySummary;

  MonthlyPaymentsMessage({this.success, this.monthlySalarySummary});

  factory MonthlyPaymentsMessage.fromJson(Map<String, dynamic> json) {
    return MonthlyPaymentsMessage(
      success: json['success'],
      monthlySalarySummary: json['monthly_salary_summary'] != null
          ? (json['monthly_salary_summary'] as List)
              .map((v) => MonthlySalarySummary.fromJson(v))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (monthlySalarySummary != null) {
      data['monthly_salary_summary'] = monthlySalarySummary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlySalarySummary {
  String? month;
  String? monthString;
  double? totalSalary; // Changed from int to double for better precision

  MonthlySalarySummary({this.month, this.monthString, this.totalSalary});

  factory MonthlySalarySummary.fromJson(Map<String, dynamic> json) {
    return MonthlySalarySummary(
      month: json['month'],
      monthString: json['month_string'],
      totalSalary: json['total_salary']?.toDouble(), // Ensures correct type conversion
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['month_string'] = monthString;
    data['total_salary'] = totalSalary;
    return data;
  }
}
