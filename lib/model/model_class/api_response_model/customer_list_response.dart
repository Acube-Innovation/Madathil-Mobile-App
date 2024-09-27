class CustomerListResponse {
  List<Customer>? data;

  CustomerListResponse({
    this.data,
  });

  factory CustomerListResponse.fromJson(Map<String, dynamic> json) =>
      CustomerListResponse(
        data:
            List<Customer>.from(json["data"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Customer {
  String? name;
  String? customerName;
  String? image;
  String? emailId;
  String? mobileNo;

  Customer({
    this.name,
    this.customerName,
    this.image,
    this.emailId,
    this.mobileNo,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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
