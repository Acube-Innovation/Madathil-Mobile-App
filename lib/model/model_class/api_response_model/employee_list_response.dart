class EmployeeListResponse {
  Message? message;

  EmployeeListResponse({this.message});

  EmployeeListResponse.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  bool? success;
  List<Employees>? employees;

  Message({this.success, this.employees});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  String? name;
  String? employeeName;
  String? designation;
  String? company;
  String? employeeZone;
  String? employeeRegion;
  String? employeeArea;
  String? employeePanchayat;

  Employees({
    this.name,
    this.employeeName,
    this.designation,
    this.company,
    this.employeeZone,
    this.employeeRegion,
    this.employeeArea,
    this.employeePanchayat,
  });

  Employees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    employeeName = json['employee_name'];
    designation = json['designation'];
    company = json['company'];
    employeeZone = json['employee_zone'];
    employeeRegion = json['employee_region'];
    employeeArea = json['employee_area'];
    employeePanchayat = json['employee_panchayat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['employee_name'] = employeeName;
    data['designation'] = designation;
    data['company'] = company;
    data['employee_zone'] = employeeZone;
    data['employee_region'] = employeeRegion;
    data['employee_area'] = employeeArea;
    data['employee_panchayat'] = employeePanchayat;
    return data;
  }
}
