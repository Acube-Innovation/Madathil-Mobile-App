class AddFollowUpResponse {
  FollowUpData? data;

  AddFollowUpResponse({this.data});

  AddFollowUpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? FollowUpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FollowUpData {
  String? name;
  String? owner;
  String? dateAndTime;
  String? status;
  String? feedback;
  String? doctype;

  FollowUpData({
    this.name,
    this.owner,
    this.dateAndTime,
    this.status,
    this.feedback,
    this.doctype,
  });

  FollowUpData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    dateAndTime = json['date_and_time'];
    status = json['status'];
    feedback = json['feedback'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['date_and_time'] = this.dateAndTime;
    data['status'] = this.status;
    data['feedback'] = this.feedback;
    data['doctype'] = this.doctype;
    return data;
  }
}
