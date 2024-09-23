class LoginResponse {
  Message? message;

  LoginResponse({this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  String? docName;
  String? message;

  Message({this.success, this.docName, this.message});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    docName = json['doc_name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['doc_name'] = docName;
    data['message'] = message;
    return data;
  }
}
