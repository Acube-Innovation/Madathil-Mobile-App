class LeadsSourceListResponse {
  List<LeadsSourceList>? data;

  LeadsSourceListResponse({this.data});

  LeadsSourceListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LeadsSourceList>[];
      json['data'].forEach((v) {
        data!.add(LeadsSourceList.fromJson(v));
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

class LeadsSourceList {
  String? name;

  LeadsSourceList({this.name});

  LeadsSourceList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
