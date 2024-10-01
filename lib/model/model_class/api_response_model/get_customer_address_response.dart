class GetCustomerAddress {
  List<CustomerAddress>? message;

  GetCustomerAddress({
    this.message,
  });

  factory GetCustomerAddress.fromJson(Map<String, dynamic> json) =>
      GetCustomerAddress(
        message: List<CustomerAddress>.from(
            json["message"].map((x) => CustomerAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class CustomerAddress {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;

  CustomerAddress({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
      };
}
