class CheckInCheckOutResponse {
  final Data? data;

  CheckInCheckOutResponse({this.data});

  factory CheckInCheckOutResponse.fromJson(Map<String, dynamic> json) {
    return CheckInCheckOutResponse(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (data != null) 'data': data!.toJson(),
    };
  }
}

class Data {
  final String? name;
  final String? owner;
  final String? creation;
  final String? modified;
  final String? modifiedBy;
  final dynamic parent;
  final dynamic parentfield;
  final dynamic parenttype;
  final int? idx;
  final int? docstatus;
  final String? employee;
  final String? employeeName;
  final String? logType;
  final dynamic task;
  final dynamic customer;
  final dynamic subject;
  final dynamic status;
  final dynamic issue;
  final dynamic shift;
  final String? time;
  final String? date;
  final dynamic deviceId;
  final int? skipAutoAttendance;
  final dynamic attendance;
  final dynamic shiftStart;
  final dynamic shiftEnd;
  final dynamic shiftActualStart;
  final dynamic shiftActualEnd;
  final String? longitude;
  final String? latitude;
  final dynamic city;
  final dynamic state;
  final dynamic area;
  final dynamic project;
  final String? doctype;

  Data({
    this.name,
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
    this.doctype,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      owner: json['owner'],
      creation: json['creation'],
      modified: json['modified'],
      modifiedBy: json['modified_by'],
      parent: json['parent'],
      parentfield: json['parentfield'],
      parenttype: json['parenttype'],
      idx: json['idx'] as int?,
      docstatus: json['docstatus'] as int?,
      employee: json['employee'],
      employeeName: json['employee_name'],
      logType: json['log_type'],
      task: json['task'],
      customer: json['customer'],
      subject: json['subject'],
      status: json['status'],
      issue: json['issue'],
      shift: json['shift'],
      time: json['time'],
      date: json['date'],
      deviceId: json['device_id'],
      skipAutoAttendance: json['skip_auto_attendance'] as int?,
      attendance: json['attendance'],
      shiftStart: json['shift_start'],
      shiftEnd: json['shift_end'],
      shiftActualStart: json['shift_actual_start'],
      shiftActualEnd: json['shift_actual_end'],
      longitude: json['longitude']?.toString(), // Safe conversion to String
      latitude: json['latitude']?.toString(),   // Safe conversion to String
      city: json['city'],
      state: json['state'],
      area: json['area'],
      project: json['project'],
      doctype: json['doctype'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'creation': creation,
      'modified': modified,
      'modified_by': modifiedBy,
      'parent': parent,
      'parentfield': parentfield,
      'parenttype': parenttype,
      'idx': idx,
      'docstatus': docstatus,
      'employee': employee,
      'employee_name': employeeName,
      'log_type': logType,
      'task': task,
      'customer': customer,
      'subject': subject,
      'status': status,
      'issue': issue,
      'shift': shift,
      'time': time,
      'date': date,
      'device_id': deviceId,
      'skip_auto_attendance': skipAutoAttendance,
      'attendance': attendance,
      'shift_start': shiftStart,
      'shift_end': shiftEnd,
      'shift_actual_start': shiftActualStart,
      'shift_actual_end': shiftActualEnd,
      'longitude': longitude,
      'latitude': latitude,
      'city': city,
      'state': state,
      'area': area,
      'project': project,
      'doctype': doctype,
    };
  }
}
