class SalesPersonsListResponse {
  List<SalesPerson>? data;

  SalesPersonsListResponse({this.data});

  SalesPersonsListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SalesPerson>[];
      json['data'].forEach((v) {
        data!.add(SalesPerson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SalesPerson {
  String? name;
  String? salesPersonName;

  SalesPerson({this.name, this.salesPersonName});

  SalesPerson.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salesPersonName = json['sales_person_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['sales_person_name'] = salesPersonName;
    return data;
  }
}
