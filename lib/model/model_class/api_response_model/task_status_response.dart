class TaskStatusListResponse {
  List<String>? message;

  TaskStatusListResponse({this.message});

  TaskStatusListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
