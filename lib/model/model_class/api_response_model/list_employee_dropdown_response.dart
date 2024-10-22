class ListEmployeeDropDownResponse {
  List<Employee>? employees;

  ListEmployeeDropDownResponse({this.employees});

  ListEmployeeDropDownResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      employees = <Employee>[];
      json['data'].forEach((v) {
        employees!.add(Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employees != null) {
      data['data'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  String? name;
  String? fullName;

  Employee({this.name, this.fullName});

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['full_name'] = fullName;
    return data;
  }
}
