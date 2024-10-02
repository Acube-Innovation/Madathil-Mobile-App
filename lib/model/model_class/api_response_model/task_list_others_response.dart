class TasksListOthersResponse {
  List<TasksListOthersData>? data;

  TasksListOthersResponse({this.data});

  TasksListOthersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TasksListOthersData>[];
      json['data'].forEach((v) {
        data!.add(TasksListOthersData.fromJson(v));
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

class TasksListOthersData {
  String? name;
  String? customer;
  String? subject;
  String? status;
  String? contactNumber;
  dynamic type;
  dynamic description;
  String? expStartDate;
  String? expEndDate;
  double? expectedTime;

  TasksListOthersData(
      {this.name,
      this.customer,
      this.subject,
      this.status,
      this.contactNumber,
      this.type,
      this.description,
      this.expStartDate,
      this.expEndDate,
      this.expectedTime});

  TasksListOthersData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customer = json['customer'];
    subject = json['subject'];
    status = json['status'];
    contactNumber = json['contact_number'];
    type = json['type'];
    description = json['description'];
    expStartDate = json['exp_start_date'];
    expEndDate = json['exp_end_date'];
    expectedTime = json['expected_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['customer'] = customer;
    data['subject'] = subject;
    data['status'] = status;
    data['contact_number'] = contactNumber;
    data['type'] = type;
    data['description'] = description;
    data['exp_start_date'] = expStartDate;
    data['exp_end_date'] = expEndDate;
    data['expected_time'] = expectedTime;
    return data;
  }
}
