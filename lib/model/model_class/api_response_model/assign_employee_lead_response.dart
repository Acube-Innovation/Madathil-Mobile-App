class AssignEmployeeLeadResponse {
  List<EmployeeMessage>? messages;

  AssignEmployeeLeadResponse({this.messages});

  AssignEmployeeLeadResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      messages = <EmployeeMessage>[];
      json['message'].forEach((v) {
        messages!.add(EmployeeMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messages != null) {
      data['message'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeMessage {
  String? owner;
  String? name;

  EmployeeMessage({this.owner, this.name});

  EmployeeMessage.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner'] = owner;
    data['name'] = name;
    return data;
  }
}
