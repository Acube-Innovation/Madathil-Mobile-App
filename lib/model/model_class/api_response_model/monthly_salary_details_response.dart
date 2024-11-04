class MonthlySalaryDetailsResponse {
  final MonthlySalaryMessage? message;

  MonthlySalaryDetailsResponse({this.message});

  factory MonthlySalaryDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MonthlySalaryDetailsResponse(
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
  final String? monthString;
  final int? totalPoints;
  final double? totalSalary;
  final double? totalIncentives;
  final double? totalSalaryPaid;
  final List<DetailedRows>? detailedRows;
  final List<SalaryPayments>? payments;

  MonthlySalaryMessage({
    this.success,
    this.monthString,
    this.totalPoints,
    this.totalSalary,
    this.totalIncentives,
    this.totalSalaryPaid,
    this.detailedRows,
    this.payments,
  });

  factory MonthlySalaryMessage.fromJson(Map<String, dynamic> json) {
    return MonthlySalaryMessage(
      success: json['success'],
      monthString: json['month_string'],
      totalPoints: json['total_points'] as int?,
      totalSalary: (json['total_salary'] as num?)?.toDouble(),
      totalIncentives: (json['total_incentives'] as num?)?.toDouble(),
      totalSalaryPaid: (json['total_salary_paid'] as num?)?.toDouble(),
      detailedRows: (json['detailed_rows'] as List<dynamic>?)
          ?.map((item) => DetailedRows.fromJson(item))
          .toList(),
      payments: (json['payments'] as List<dynamic>?)
          ?.map((item) => SalaryPayments.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'month_string': monthString,
      'total_points': totalPoints,
      'total_salary': totalSalary,
      'total_incentives': totalIncentives,
      'total_salary_paid': totalSalaryPaid,
      if (detailedRows != null)
        'detailed_rows': detailedRows!.map((item) => item.toJson()).toList(),
      if (payments != null)
        'payments': payments!.map((item) => item.toJson()).toList(),
    };
  }
}

class DetailedRows {
  final String? closingStatement;
  final String? customerName;
  final String? item;
  final double? projectCost;
  final String? closingDate;
  final int? points;
  final double? salary;
  final double? incentives;
  final double? totalInvoiceAmount;
  final double? paidInvoiceAmount;

  DetailedRows({
    this.closingStatement,
    this.customerName,
    this.item,
    this.projectCost,
    this.closingDate,
    this.points,
    this.salary,
    this.incentives,
    this.totalInvoiceAmount,
    this.paidInvoiceAmount,
  });

  factory DetailedRows.fromJson(Map<String, dynamic> json) {
    return DetailedRows(
      closingStatement: json['closing_statement'],
      customerName: json['customer_name'],
      item: json['item'],
      projectCost: (json['project_cost'] as num?)?.toDouble(),
      closingDate: json['closing_date'],
      points: json['points'] as int?,
      salary: (json['salary'] as num?)?.toDouble(),
      incentives: (json['incentives'] as num?)?.toDouble(),
      totalInvoiceAmount: (json['total_invoice_amount'] as num?)?.toDouble(),
      paidInvoiceAmount: (json['paid_invoice_amount'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'closing_statement': closingStatement,
      'customer_name': customerName,
      'item': item,
      'project_cost': projectCost,
      'closing_date': closingDate,
      'points': points,
      'salary': salary,
      'incentives': incentives,
      'total_invoice_amount': totalInvoiceAmount,
      'paid_invoice_amount': paidInvoiceAmount,
    };
  }
}

class SalaryPayments {
  final String? paymentEntryId;
  final String? postingDate;
  final double? paidAmount;
  final String? modeOfPayment;
  final String? remarks;

  SalaryPayments({
    this.paymentEntryId,
    this.postingDate,
    this.paidAmount,
    this.modeOfPayment,
    this.remarks,
  });

  factory SalaryPayments.fromJson(Map<String, dynamic> json) {
    return SalaryPayments(
      paymentEntryId: json['payment_entry_id'],
      postingDate: json['posting_date'],
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      modeOfPayment: json['mode_of_payment'],
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_entry_id': paymentEntryId,
      'posting_date': postingDate,
      'paid_amount': paidAmount,
      'mode_of_payment': modeOfPayment,
      'remarks': remarks,
    };
  }
}
