class AttendanceList {
  List<AttendanceListData>? data;

  AttendanceList({this.data});

  AttendanceList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AttendanceListData>[];
      json['data'].forEach((v) {
        data!.add(AttendanceListData.fromJson(v));
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

class AttendanceListData {
  String? name;
  String? attendanceDate;
  String? employeeInTime;
  Null employeeOutTime;
  String? status;
  String? city;
  String? state;
  String? area;

  AttendanceListData(
      {this.name,
      this.attendanceDate,
      this.employeeInTime,
      this.employeeOutTime,
      this.status,
      this.city,
      this.state,
      this.area});

  AttendanceListData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    attendanceDate = json['attendance_date'];
    employeeInTime = json['employee_in_time'];
    employeeOutTime = json['employee_out_time'];
    status = json['status'];
    city = json['city'];
    state = json['state'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['attendance_date'] = attendanceDate;
    data['employee_in_time'] = employeeInTime;
    data['employee_out_time'] = employeeOutTime;
    data['status'] = status;
    data['city'] = city;
    data['state'] = state;
    data['area'] = area;
    return data;
  }
}
