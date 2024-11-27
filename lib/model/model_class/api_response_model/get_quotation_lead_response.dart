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
  String? creation;
  String? fileName;

  QuotationLeadData({this.name, this.creation,this.fileName});

  factory QuotationLeadData.fromJson(Map<String, dynamic> json) {
    return QuotationLeadData(
      name: json['name'],
      creation: json['creation'],
      fileName: json['quoation_print_specification']
      
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'creation' : creation,
      'quoation_print_specification' : fileName,
    };
  }
}
