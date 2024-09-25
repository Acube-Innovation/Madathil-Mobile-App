class CheckInCheckOutListResponse {
  List<CheckInCheckOutListData>? data;

  CheckInCheckOutListResponse({this.data});

  CheckInCheckOutListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CheckInCheckOutListData>[];
      json['data'].forEach((v) {
        data!.add(CheckInCheckOutListData.fromJson(v));
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

class CheckInCheckOutListData {
  String? name;
  String? time;
  String? logType;

  CheckInCheckOutListData({this.name, this.time, this.logType});

  CheckInCheckOutListData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    logType = json['log_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['time'] = time;
    data['log_type'] = logType;
    return data;
  }
}
