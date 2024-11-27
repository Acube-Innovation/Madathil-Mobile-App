class QuotationFileResponse {
  List<QuotationLeadFile>? data;

  QuotationFileResponse({this.data});

  factory QuotationFileResponse.fromJson(Map<String, dynamic> json) {
    return QuotationFileResponse(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => QuotationLeadFile.fromJson(item))
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

class QuotationLeadFile {
  String? fileUrl;
  String? fileName;
  String? creation;

  QuotationLeadFile({this.fileUrl, this.fileName, this.creation});

  factory QuotationLeadFile.fromJson(Map<String, dynamic> json) {
    return QuotationLeadFile(
      fileUrl: json['file_url'],
      fileName: json['file_name'],
      creation: json['creation']
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file_url': fileUrl,
      'file_name': fileName,
      'creation': creation
    };
  }
}
