class MonthlySalaryListResponse {
  final MonthlySalaryMessage? message;

  MonthlySalaryListResponse({this.message});

  factory MonthlySalaryListResponse.fromJson(Map<String, dynamic> json) {
    return MonthlySalaryListResponse(
      message: json['message'] != null
          ? MonthlySalaryMessage.fromJson(json['message'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message!.toJson(),
    };
  }
}

class MonthlySalaryMessage {
  final bool? success;
  final int? totalPoints;
  final int? totalSalaryPoints;
  final int? totalIncentives;
  final int? totalSalaryPaid;
  final List<Summary>? summary;

  MonthlySalaryMessage({
    this.success,
    this.totalPoints,
    this.totalSalaryPoints,
    this.totalIncentives,
    this.totalSalaryPaid,
    this.summary,
  });

  factory MonthlySalaryMessage.fromJson(Map<String, dynamic> json) {
    return MonthlySalaryMessage(
      success: json['success'],
      totalPoints: (json['total_points'] as num?)?.toInt(),
      totalSalaryPoints: (json['total_salary_points'] as num?)?.toInt(),
      totalIncentives: (json['total_incentives'] as num?)?.toInt(),
      totalSalaryPaid: (json['total_salary_paid'] as num?)?.toInt(),
      summary: (json['summary'] as List<dynamic>?)
          ?.map((item) => Summary.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'total_points': totalPoints,
      'total_salary_points': totalSalaryPoints,
      'total_incentives': totalIncentives,
      'total_salary_paid': totalSalaryPaid,
      if (summary != null)
        'summary': summary!.map((item) => item.toJson()).toList(),
    };
  }
}

class Summary {
  final String? month;
  final String? monthString;
  final int? points;
  final int? salary;
  final int? incentives;
  final int? salaryPaid;

  Summary({
    this.month,
    this.monthString,
    this.points,
    this.salary,
    this.incentives,
    this.salaryPaid,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      month: json['month'],
      monthString: json['month_string'],
      points: (json['points'] as num?)?.toInt(),
      salary: (json['salary'] as num?)?.toInt(),
      incentives: (json['incentives'] as num?)?.toInt(),
      salaryPaid: (json['salary_paid'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'month_string': monthString,
      'points': points,
      'salary': salary,
      'incentives': incentives,
      'salary_paid': salaryPaid,
    };
  }
}
