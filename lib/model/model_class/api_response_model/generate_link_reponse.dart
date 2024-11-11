class GenerateLinkResponse {
  GenerateLinkMessage? message;

  GenerateLinkResponse({this.message});

  GenerateLinkResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null
        ? GenerateLinkMessage.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class GenerateLinkMessage {
  bool? success;
  String? paymentLink;

  GenerateLinkMessage({this.success, this.paymentLink});

  GenerateLinkMessage.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['payment_link'] = paymentLink;
    return data;
  }
}
