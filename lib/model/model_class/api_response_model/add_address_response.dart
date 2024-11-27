class AddAddressResponse {
  AddressData? data;

  AddAddressResponse({this.data});

  AddAddressResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AddressData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddressData {
  String? name;
  String? addressTitle;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  List<Links>? links;

  AddressData({
    this.name,
    this.addressTitle,
    this.addressType,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.links,
  });

  AddressData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    addressTitle = json['address_title'];
    addressType = json['address_type'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['address_title'] = this.addressTitle;
    data['address_type'] = this.addressType;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? linkDoctype;
  String? linkName;

  Links({
    this.linkDoctype,
    this.linkName,
  });

  Links.fromJson(Map<String, dynamic> json) {
    linkDoctype = json['link_doctype'];
    linkName = json['link_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link_doctype'] = this.linkDoctype;
    data['link_name'] = this.linkName;
    return data;
  }
}
