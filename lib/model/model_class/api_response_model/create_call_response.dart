class CreateCallResponse {
  CreateCall? data;

  CreateCallResponse({this.data});

  CreateCallResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CreateCall.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CreateCall {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? calledNumber;
  String? callerNumber;
  String? calledDate;
  String? callDateTime;
  String? callStatus;
  String? status;
  String? callStartTime;
  String? callEndTime;
  int? conversationDuration;
  String? customer;
  String? doctype;
  List<CreateTrackCalls>? trackCalls;

  CreateCall(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.idx,
      this.docstatus,
      this.calledNumber,
      this.callerNumber,
      this.calledDate,
      this.callDateTime,
      this.callStatus,
      this.status,
      this.callStartTime,
      this.callEndTime,
      this.conversationDuration,
      this.customer,
      this.doctype,
      this.trackCalls});

  CreateCall.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    calledNumber = json['called_number'];
    callerNumber = json['caller_number'];
    calledDate = json['called_date'];
    callDateTime = json['call_date_time'];
    callStatus = json['call_status'];
    status = json['status'];
    callStartTime = json['call_start_time'];
    callEndTime = json['call_end_time'];
    conversationDuration = json['conversation_duration'];
    customer = json['customer'];
    doctype = json['doctype'];
    if (json['track_calls'] != null) {
      trackCalls = <CreateTrackCalls>[];
      json['track_calls'].forEach((v) {
        trackCalls!.add(new CreateTrackCalls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['called_number'] = this.calledNumber;
    data['caller_number'] = this.callerNumber;
    data['called_date'] = this.calledDate;
    data['call_date_time'] = this.callDateTime;
    data['call_status'] = this.callStatus;
    data['status'] = this.status;
    data['call_start_time'] = this.callStartTime;
    data['call_end_time'] = this.callEndTime;
    data['conversation_duration'] = this.conversationDuration;
    data['customer'] = this.customer;
    data['doctype'] = this.doctype;
    if (this.trackCalls != null) {
      data['track_calls'] = this.trackCalls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreateTrackCalls {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  String? parent;
  String? parentfield;
  String? parenttype;
  int? idx;
  int? docstatus;
  String? dateAndTime;
  String? status;
  String? feedback;
  String? userlink;
  Null? user;
  String? doctype;
  int? iUnsaved;

  CreateTrackCalls(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.parent,
      this.parentfield,
      this.parenttype,
      this.idx,
      this.docstatus,
      this.dateAndTime,
      this.status,
      this.feedback,
      this.userlink,
      this.user,
      this.doctype,
      this.iUnsaved});

  CreateTrackCalls.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    dateAndTime = json['date_and_time'];
    status = json['status'];
    feedback = json['feedback'];
    userlink = json['userlink'];
    user = json['user'];
    doctype = json['doctype'];
    iUnsaved = json['__unsaved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['parent'] = this.parent;
    data['parentfield'] = this.parentfield;
    data['parenttype'] = this.parenttype;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['date_and_time'] = this.dateAndTime;
    data['status'] = this.status;
    data['feedback'] = this.feedback;
    data['userlink'] = this.userlink;
    data['user'] = this.user;
    data['doctype'] = this.doctype;
    data['__unsaved'] = this.iUnsaved;
    return data;
  }
}
