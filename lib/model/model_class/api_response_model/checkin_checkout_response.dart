class CheckInCheckOutResponse {
  Data? data;

  CheckInCheckOutResponse({this.data});

  CheckInCheckOutResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  dynamic parent;
  dynamic parentfield;
  dynamic parenttype;
  int? idx;
  int? docstatus;
  String? employee;
  String? employeeName;
  String? logType;
  dynamic task;
  dynamic customer;
  dynamic subject;
  dynamic status;
  dynamic issue;
  dynamic shift;
  String? time;
  String? date;
  dynamic deviceId;
  int? skipAutoAttendance;
  dynamic attendance;
  dynamic shiftStart;
  dynamic shiftEnd;
  dynamic shiftActualStart;
  dynamic shiftActualEnd;
  String? longitude;
  String? latitude;
  dynamic city;
  dynamic state;
  dynamic area;
  dynamic project;
  String? doctype;

  Data(
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
      this.employee,
      this.employeeName,
      this.logType,
      this.task,
      this.customer,
      this.subject,
      this.status,
      this.issue,
      this.shift,
      this.time,
      this.date,
      this.deviceId,
      this.skipAutoAttendance,
      this.attendance,
      this.shiftStart,
      this.shiftEnd,
      this.shiftActualStart,
      this.shiftActualEnd,
      this.longitude,
      this.latitude,
      this.city,
      this.state,
      this.area,
      this.project,
      this.doctype});

  Data.fromJson(Map<String, dynamic> json) {
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
    employee = json['employee'];
    employeeName = json['employee_name'];
    logType = json['log_type'];
    task = json['task'];
    customer = json['customer'];
    subject = json['subject'];
    status = json['status'];
    issue = json['issue'];
    shift = json['shift'];
    time = json['time'];
    date = json['date'];
    deviceId = json['device_id'];
    skipAutoAttendance = json['skip_auto_attendance'];
    attendance = json['attendance'];
    shiftStart = json['shift_start'];
    shiftEnd = json['shift_end'];
    shiftActualStart = json['shift_actual_start'];
    shiftActualEnd = json['shift_actual_end'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    city = json['city'];
    state = json['state'];
    area = json['area'];
    project = json['project'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['idx'] = idx;
    data['docstatus'] = docstatus;
    data['employee'] = employee;
    data['employee_name'] = employeeName;
    data['log_type'] = logType;
    data['task'] = task;
    data['customer'] = customer;
    data['subject'] = subject;
    data['status'] = status;
    data['issue'] = issue;
    data['shift'] = shift;
    data['time'] = time;
    data['date'] = date;
    data['device_id'] = deviceId;
    data['skip_auto_attendance'] = skipAutoAttendance;
    data['attendance'] = attendance;
    data['shift_start'] = shiftStart;
    data['shift_end'] = shiftEnd;
    data['shift_actual_start'] = shiftActualStart;
    data['shift_actual_end'] = shiftActualEnd;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['city'] = city;
    data['state'] = state;
    data['area'] = area;
    data['project'] = project;
    data['doctype'] = doctype;
    return data;
  }
}
