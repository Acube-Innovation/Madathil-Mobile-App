class CreateAddressResponse {
  AddressData data;

  CreateAddressResponse({
    required this.data,
  });

  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      CreateAddressResponse(
        data: AddressData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class AddressData {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;
  String? addressTitle;
  String? addressType;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? county;
  String? state;
  String? country;
  String? pincode;
  String? emailId;
  String? phone;
  String? gstin;
  String? gstState;
  String? gstStateNumber;
  dynamic taxCategory;
  String? doctype;
  List<Link>? links;

  AddressData({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.addressTitle,
    this.addressType,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.county,
    this.state,
    this.country,
    this.pincode,
    this.emailId,
    this.phone,
    this.gstin,
    this.gstState,
    this.gstStateNumber,
    this.taxCategory,
    this.doctype,
    this.links,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        addressTitle: json["address_title"],
        addressType: json["address_type"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        county: json["county"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        emailId: json["email_id"],
        phone: json["phone"],
        gstin: json["gstin"],
        gstState: json["gst_state"],
        gstStateNumber: json["gst_state_number"],
        taxCategory: json["tax_category"],
        doctype: json["doctype"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "address_title": addressTitle,
        "address_type": addressType,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "county": county,
        "state": state,
        "country": country,
        "pincode": pincode,
        "email_id": emailId,
        "phone": phone,
        "gstin": gstin,
        "gst_state": gstState,
        "gst_state_number": gstStateNumber,
        "tax_category": taxCategory,
        "doctype": doctype,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
      };
}

class Link {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;
  String? parent;
  String? parentfield;
  String? parenttype;
  int? idx;
  int? docstatus;
  String? linkDoctype;
  String? linkName;
  String? linkTitle;
  String? doctype;
  int? unsaved;

  Link({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.idx,
    this.docstatus,
    this.linkDoctype,
    this.linkName,
    this.linkTitle,
    this.doctype,
    this.unsaved,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        parent: json["parent"],
        parentfield: json["parentfield"],
        parenttype: json["parenttype"],
        idx: json["idx"],
        docstatus: json["docstatus"],
        linkDoctype: json["link_doctype"],
        linkName: json["link_name"],
        linkTitle: json["link_title"],
        doctype: json["doctype"],
        unsaved: json["__unsaved"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "parent": parent,
        "parentfield": parentfield,
        "parenttype": parenttype,
        "idx": idx,
        "docstatus": docstatus,
        "link_doctype": linkDoctype,
        "link_name": linkName,
        "link_title": linkTitle,
        "doctype": doctype,
        "__unsaved": unsaved,
      };
}
