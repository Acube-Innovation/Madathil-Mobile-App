class StatusFollowUpResponse {
  List<String>? statuses;

  StatusFollowUpResponse({this.statuses});

  StatusFollowUpResponse.fromJson(Map<String, dynamic> json) {
    statuses = json['message']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (statuses != null) {
      data['message'] = statuses;
    }
    return data;
  }
}
