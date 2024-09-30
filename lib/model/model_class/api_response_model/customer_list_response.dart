class CustomerListResponse {
  List<Customer>? data;

  CustomerListResponse({this.data});

  CustomerListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Customer>[];
      json['data'].forEach((v) {
        data!.add(new Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  String? name;
  String? customerName;
  String? image;
  String? emailId;
  String? mobileNo;

  Customer(
      {this.name, this.customerName, this.image, this.emailId, this.mobileNo});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customerName = json['customer_name'];
    image = json['image'];
    emailId = json['email_id'];
    mobileNo = json['mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['customer_name'] = this.customerName;
    data['image'] = this.image;
    data['email_id'] = this.emailId;
    data['mobile_no'] = this.mobileNo;
    return data;
  }
}
