class CallListResponseModel {
  List<CallListResponse>? data;

  CallListResponseModel({this.data});

  CallListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CallListResponse>[];
      json['data'].forEach((v) {
        data!.add(new CallListResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CallListResponse {
  String? name;
  String? customer;
  String? calledNumber;
  String? calledDate;
  String? callStatus;
  double? conversationDuration;

  CallListResponse(
      {this.name,
      this.customer,
      this.calledNumber,
      this.calledDate,
      this.callStatus,
      this.conversationDuration});

  CallListResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customer = json['customer'];
    calledNumber = json['called_number'];
    calledDate = json['called_date'];
    callStatus = json['call_status'];
    conversationDuration = json['conversation_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['customer'] = this.customer;
    data['called_number'] = this.calledNumber;
    data['called_date'] = this.calledDate;
    data['call_status'] = this.callStatus;
    data['conversation_duration'] = this.conversationDuration;
    return data;
  }
}
