class GetCustomerDetailResponse {
  int? sessionExpired;
  List<CstDetail>? data;

  GetCustomerDetailResponse({
    this.sessionExpired,
    this.data,
  });

  factory GetCustomerDetailResponse.fromJson(Map<String, dynamic> json) =>
      GetCustomerDetailResponse(
        sessionExpired: json["session_expired"],
        data: List<CstDetail>.from(
            json["data"].map((x) => CstDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "session_expired": sessionExpired,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CstDetail {
  String? name;
  String? customerName;
  String? image;
  String? emailId;
  String? mobileNo;

  CstDetail({
    this.name,
    this.customerName,
    this.image,
    this.emailId,
    this.mobileNo,
  });

  factory CstDetail.fromJson(Map<String, dynamic> json) => CstDetail(
        name: json["name"],
        customerName: json["customer_name"],
        image: json["image"],
        emailId: json["email_id"],
        mobileNo: json["mobile_no"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "customer_name": customerName,
        "image": image,
        "email_id": emailId,
        "mobile_no": mobileNo,
      };
}
