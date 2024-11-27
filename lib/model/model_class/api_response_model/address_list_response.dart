class AddressListResponse {
  List<AddressDetails>? message;

  AddressListResponse({this.message});

  AddressListResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <AddressDetails>[];
      json['message'].forEach((v) {
        message!.add(AddressDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressDetails {
  String? name;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;

  AddressDetails({
    this.name,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  AddressDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    return data;
  }
}
