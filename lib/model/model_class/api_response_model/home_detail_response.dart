class HomeDetailResponse {
  Message? message;

  HomeDetailResponse({this.message});

  HomeDetailResponse.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? email;
  String? fullName;
  dynamic roleProfile;
  int? openLeads;
  int? sales;
  int? referralPoints;
  dynamic employeeId;

  Message(
      {this.image,
      this.email,
      this.fullName,
      this.roleProfile,
      this.openLeads,
      this.sales,
      this.referralPoints,
      this.employeeId});

  Message.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    email = json['email'];
    fullName = json['full_name'];
    roleProfile = json['role_profile'];
    openLeads = json['open_leads'];
    sales = json['sales'];
    referralPoints = json['referral_points'];
    employeeId = json['employee_id'] ?? json['customer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['email'] = email;
    data['full_name'] = fullName;
    data['role_profile'] = roleProfile;
    data['open_leads'] = openLeads;
    data['sales'] = sales;
    data['referral_points'] = referralPoints;
    data['employee_id'] = employeeId;
    return data;
  }
}
