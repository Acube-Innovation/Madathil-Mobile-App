class LeadsListOwnResponse {
  List<LeadsListOwnList>? data;

  LeadsListOwnResponse({this.data});

  LeadsListOwnResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LeadsListOwnList>[];
      json['data'].forEach((v) {
        data!.add(LeadsListOwnList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeadsListOwnList {
  String? name;
  String? leadName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  Null pincode;
  String? ldSource;
  String? leadCategory;
  String? numberToBeContacted;
  Null emailId;
  Null aadhaarNumber;
  String? consumerNumber;
  String? status;
  String? leadOwner;
  String? creation;

  LeadsListOwnList(
      {this.name,
      this.leadName,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.ldSource,
      this.leadCategory,
      this.numberToBeContacted,
      this.emailId,
      this.aadhaarNumber,
      this.consumerNumber,
      this.status,
      this.leadOwner,
      this.creation});

  LeadsListOwnList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    leadName = json['lead_name'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    ldSource = json['ld_source'];
    leadCategory = json['lead_category'];
    numberToBeContacted = json['number_to_be_contacted'];
    emailId = json['email_id'];
    aadhaarNumber = json['aadhaar_number'];
    consumerNumber = json['consumer_number'];
    status = json['status'];
    leadOwner = json['lead_owner'];
    creation = json['creation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lead_name'] = leadName;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['ld_source'] = ldSource;
    data['lead_category'] = leadCategory;
    data['number_to_be_contacted'] = numberToBeContacted;
    data['email_id'] = emailId;
    data['aadhaar_number'] = aadhaarNumber;
    data['consumer_number'] = consumerNumber;
    data['status'] = status;
    data['lead_owner'] = leadOwner;
    data['creation'] = creation;
    return data;
  }
}
