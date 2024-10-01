class CreateCustomerResponse {
  CstData data;

  CreateCustomerResponse({
    required this.data,
  });

  factory CreateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      CreateCustomerResponse(
        data: CstData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class CstData {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;

  String? namingSeries;
  String? customerName;
  dynamic gender;
  String? aadhaarNumber;
  String? customerType;

  String? pan;

  String? image;

  dynamic user;
  dynamic accountManager;
  dynamic whatsappNumber;
  String? customerGroup;
  String? territory;

  String? customerPrimaryContact;
  String? mobileNo;
  String? emailId;
  String? customerPrimaryAddress;
  String? primaryAddress;
  String? paymentTerms;
  String? customerDetails;

  String? doctype;

  CstData({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.namingSeries,
    this.customerName,
    this.gender,
    this.aadhaarNumber,
    this.customerType,
    this.pan,
    this.image,
    this.user,
    this.accountManager,
    this.whatsappNumber,
    this.customerGroup,
    this.territory,
    this.customerPrimaryContact,
    this.mobileNo,
    this.emailId,
    this.customerPrimaryAddress,
    this.primaryAddress,
    this.paymentTerms,
    this.customerDetails,
    this.doctype,
  });

  factory CstData.fromJson(Map<String, dynamic> json) => CstData(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        namingSeries: json["naming_series"],
        customerName: json["customer_name"],
        gender: json["gender"],
        aadhaarNumber: json["aadhaar_number"],
        customerType: json["customer_type"],
        pan: json["pan"],
        image: json["image"],
        user: json["user"],
        accountManager: json["account_manager"],
        whatsappNumber: json["whatsapp_number"],
        customerGroup: json["customer_group"],
        territory: json["territory"],
        customerPrimaryContact: json["customer_primary_contact"],
        mobileNo: json["mobile_no"],
        emailId: json["email_id"],
        customerPrimaryAddress: json["customer_primary_address"],
        primaryAddress: json["primary_address"],
        paymentTerms: json["payment_terms"],
        customerDetails: json["customer_details"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "naming_series": namingSeries,
        "customer_name": customerName,
        "gender": gender,
        "aadhaar_number": aadhaarNumber,
        "customer_type": customerType,
        "pan": pan,
        "image": image,
        "user": user,
        "account_manager": accountManager,
        "whatsapp_number": whatsappNumber,
        "customer_group": customerGroup,
        "territory": territory,
        "customer_primary_contact": customerPrimaryContact,
        "mobile_no": mobileNo,
        "email_id": emailId,
        "customer_primary_address": customerPrimaryAddress,
        "primary_address": primaryAddress,
        "payment_terms": paymentTerms,
        "customer_details": customerDetails,
        "doctype": doctype,
      };
}
