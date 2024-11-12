class LeadsDetailsResponse {
  LeadsDetailsData? data;

  LeadsDetailsResponse({this.data});

  LeadsDetailsResponse.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? LeadsDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LeadsDetailsData {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  int? organizationLead;
  int? emiCustomer;
  String? emailId;
  String? namingSeries;
  String? leadName;
  String? leadCategory;
  String? districtName;
  String? ldSource;
  String? consumerNumber;
  String? numberToBeContacted;
  String? leadOwner;
  String? status;
  String? attendance;
  String? previousLead;
  String? typeOfOrganization;
  String? currentStatus;
  String? date;
  String? boardName;
  String? category;
  String? schemeName;
  double? subsidyPercent;
  double? subsidyAmount;
  String? contactBy;
  String? subsidy;
  String? averageElectricityBill;
  double? subsidyPercentage;
  String? addressLink;
  String? contactLink;
  String? addressType;
  String? addressTitle;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? phone;
  String? mobileNo;
  String? subsidy2;
  int? fetchCurrentLocation;
  String? latitude;
  String? longitude;
  String? area;
  String? place;
  String? type;
  double? connectedLoad;
  String? requestType;
  String? leadStatus;
  String? company;
  double? proposedProjectCapacity;
  String? language;
  int? unsubscribed;
  int? blogSubscriber;
  String? title;
  int? cnot;
  int? enot;
  int? lownot;
  String? doctype;
  List<LeadTracking>? leadTracking;
  // List<dynamic>? sd;
  // List<dynamic>? leadAddress;
  // List<dynamic>? leadContact;

  LeadsDetailsData({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.idx,
    this.docstatus,
    this.organizationLead,
    this.emiCustomer,
    this.namingSeries,
    this.leadName,
    this.emailId,
    this.leadCategory,
    this.districtName,
    this.ldSource,
    this.consumerNumber,
    this.numberToBeContacted,
    this.leadOwner,
    this.status,
    this.attendance,
    this.previousLead,
    this.typeOfOrganization,
    this.currentStatus,
    this.date,
    this.boardName,
    this.category,
    this.schemeName,
    this.subsidyPercent,
    this.subsidyAmount,
    this.contactBy,
    this.subsidy,
    this.subsidyPercentage,
    this.addressLink,
    this.contactLink,
    this.addressType,
    this.addressTitle,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.phone,
    this.mobileNo,
    this.subsidy2,
    this.fetchCurrentLocation,
    this.latitude,
    this.longitude,
    this.area,
    this.place,
    this.type,
    this.averageElectricityBill,
    this.connectedLoad,
    this.requestType,
    this.leadStatus,
    this.company,
    this.proposedProjectCapacity,
    this.language,
    this.unsubscribed,
    this.blogSubscriber,
    this.title,
    this.cnot,
    this.enot,
    this.lownot,
    this.doctype,
    this.leadTracking,
    // this.sd,
    // this.leadAddress,
    // this.leadContact,
  });

  LeadsDetailsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    organizationLead = json['organization_lead'];
    emiCustomer = json['emi_customer'];
    namingSeries = json['naming_series'];
    leadName = json['lead_name'];
    leadCategory = json['lead_category'];
    districtName = json['district_name'];
    ldSource = json['ld_source'];
    emailId = json['email_id'];
    consumerNumber = json['consumer_number'];
    numberToBeContacted = json['number_to_be_contacted'];
    leadOwner = json['lead_owner'];
    status = json['status'];
    attendance = json['attendance'];
    previousLead = json['previous_lead'];
    typeOfOrganization = json['type_of_organization'];
    currentStatus = json['current_status'];
    date = json['date'];
    boardName = json['board_name'];
    category = json['category'];
    schemeName = json['scheme_name'];
    subsidyPercent = json['subsidy_percent'];
    subsidyAmount = json['subsidy_amount'];
    contactBy = json['contact_by'];
    subsidy = json['subsidy'];
    averageElectricityBill = json['average_electricity_bill1'];
    subsidyPercentage = json['subsidy_percentage'];
    addressLink = json['address_link'];
    contactLink = json['contact_link'];
    addressType = json['address_type'];
    addressTitle = json['address_title'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    phone = json['phone'];
    mobileNo = json['mobile_no'];
    subsidy2 = json['subsidy2'];
    fetchCurrentLocation = json['fetch_current_location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    area = json['area'];
    place = json['place'];
    type = json['type'];
    connectedLoad = json['connected_load'];
    requestType = json['request_type'];
    leadStatus = json['lead_status'];
    company = json['company'];
    proposedProjectCapacity = json['proposed_project_capacity'];
    language = json['language'];
    unsubscribed = json['unsubscribed'];
    blogSubscriber = json['blog_subscriber'];
    title = json['title'];
    cnot = json['cnot'];
    enot = json['enot'];
    lownot = json['lownot'];
    doctype = json['doctype'];
    if (json['lead_tracking'] != null) {
      leadTracking = <LeadTracking>[];
      json['lead_tracking'].forEach((v) {
        leadTracking!.add(LeadTracking.fromJson(v));
      });
    }
    // if (json['sd'] != null) {
    //   sd = <dynamic>[];
    //   json['sd'].forEach((v) {
    //     sd!.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json['lead_address'] != null) {
    //   leadAddress = <dynamic>[];
    //   json['lead_address'].forEach((v) {
    //     leadAddress!.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json['lead_contact'] != null) {
    //   leadContact = <dynamic>[];
    //   json['lead_contact'].forEach((v) {
    //     leadContact!.add(dynamic.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['idx'] = idx;
    data['docstatus'] = docstatus;
    data['organization_lead'] = organizationLead;
    data['emi_customer'] = emiCustomer;
    data['naming_series'] = namingSeries;
    data['lead_name'] = leadName;
    data['lead_category'] = leadCategory;
    data['district_name'] = districtName;
    data['ld_source'] = ldSource;
    data['email_id'] = emailId;
    data['consumer_number'] = consumerNumber;
    data['number_to_be_contacted'] = numberToBeContacted;
    data['lead_owner'] = leadOwner;
    data['status'] = status;
    data['attendance'] = attendance;
    data['previous_lead'] = previousLead;
    data['type_of_organization'] = typeOfOrganization;
    data['current_status'] = currentStatus;
    data['date'] = date;
    data['board_name'] = boardName;
    data['category'] = category;
    data['scheme_name'] = schemeName;
    data['subsidy_percent'] = subsidyPercent;
    data['subsidy_amount'] = subsidyAmount;
    data['contact_by'] = contactBy;
    data['subsidy'] = subsidy;
    data['average_electricity_bill1'] = averageElectricityBill;
    data['subsidy_percentage'] = subsidyPercentage;
    data['address_link'] = addressLink;
    data['contact_link'] = contactLink;
    data['address_type'] = addressType;
    data['address_title'] = addressTitle;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['phone'] = phone;
    data['mobile_no'] = mobileNo;
    data['subsidy2'] = subsidy2;
    data['fetch_current_location'] = fetchCurrentLocation;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['area'] = area;
    data['place'] = place;
    data['type'] = type;
    data['connected_load'] = connectedLoad;
    data['request_type'] = requestType;
    data['lead_status'] = leadStatus;
    data['company'] = company;
    data['proposed_project_capacity'] = proposedProjectCapacity;
    data['language'] = language;
    data['unsubscribed'] = unsubscribed;
    data['blog_subscriber'] = blogSubscriber;
    data['title'] = title;
    data['cnot'] = cnot;
    data['enot'] = enot;
    data['lownot'] = lownot;
    data['doctype'] = doctype;
    if (leadTracking != null) {
      data['lead_tracking'] = leadTracking!.map((v) => v.toJson()).toList();
    }
    // if (sd != null) {
    //   data['sd'] = sd!.map((v) => v.toJson()).toList();
    // }
    // if (leadAddress != null) {
    //   data['lead_address'] = leadAddress!.map((v) => v.toJson()).toList();
    // }
    // if (leadContact != null) {
    //   data['lead_contact'] = leadContact!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class LeadTracking {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  String? parent;
  String? parentfield;
  String? parenttype;
  int? idx;
  int? docstatus;
  String? dateAndTime;
  String? status;
  String? doctype;
  String? feedback;

  LeadTracking(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.parent,
      this.parentfield,
      this.parenttype,
      this.idx,
      this.docstatus,
      this.dateAndTime,
      this.status,
      this.doctype,
      this.feedback});

  LeadTracking.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    dateAndTime = json['date_and_time'];
    status = json['status'];
    doctype = json['doctype'];
    feedback = json['feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['idx'] = idx;
    data['docstatus'] = docstatus;
    data['date_and_time'] = dateAndTime;
    data['status'] = status;
    data['doctype'] = doctype;
    data['feedback'] = feedback;
    return data;
  }
}
