class TasksListOwnResponse {
  List<TasksListOwnList>? message;

  TasksListOwnResponse({this.message});

  TasksListOwnResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <TasksListOwnList>[];
      json['message'].forEach((v) {
        message!.add(TasksListOwnList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TasksListOwnList {
  String? name;
  String? customer;
  String? subject;
  String? description;
  String? status;
  String? assignedUser;
  String? contactNumber;
  String? type;
  String? expStartDate;
  String? expEndDate;
  dynamic expectedTime;

  TasksListOwnList(
      {this.name,
      this.customer,
      this.subject,
      this.description,
      this.status,
      this.assignedUser,
      this.contactNumber,
      this.type,
      this.expStartDate,
      this.expEndDate,
      this.expectedTime});

  TasksListOwnList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customer = json['customer'];
    subject = json['subject'];
    description = json['description'];
    status = json['status'];
    assignedUser = json['assigned_user'];
    contactNumber = json['contact_number'];
    type = json['type'];
    expStartDate = json['exp_start_date'];
    expEndDate = json['exp_end_date'];
    expectedTime = json['expected_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['customer'] = customer;
    data['subject'] = subject;
    data['description'] = description;
    data['status'] = status;
    data['assigned_user'] = assignedUser;
    data['contact_number'] = contactNumber;
    data['type'] = type;
    data['exp_start_date'] = expStartDate;
    data['exp_end_date'] = expEndDate;
    data['expected_time'] = expectedTime;
    return data;
  }
}
