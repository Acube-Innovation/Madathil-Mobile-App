class GetQuotationLeadResponse {
  List<QuotationLeadData>? data;

  GetQuotationLeadResponse({this.data});

  factory GetQuotationLeadResponse.fromJson(Map<String, dynamic> json) {
    return GetQuotationLeadResponse(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => QuotationLeadData.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class QuotationLeadData {
  String? name;

  QuotationLeadData({this.name});

  factory QuotationLeadData.fromJson(Map<String, dynamic> json) {
    return QuotationLeadData(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
