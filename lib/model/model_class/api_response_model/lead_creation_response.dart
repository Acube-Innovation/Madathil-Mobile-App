class LeadsCreationResponse {
  Data? data;

  LeadsCreationResponse({this.data});

  LeadsCreationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  dynamic parent;
  dynamic parentfield;
  dynamic parenttype;
  dynamic idx;
  dynamic docstatus;
  dynamic organizationLead;
  dynamic emiCustomer;
  dynamic bankLoanProvider;
  String? namingSeries;
  String? leadName;
  dynamic companyName;
  String? leadCategory;
  String? aadhaarNumber;
  String? emailId;
  dynamic itemName;
  dynamic district;
  dynamic districtName;
  String? ldSource;
  dynamic leadSourceName;
  String? consumerNumber;
  String? numberToBeContacted;
  dynamic whatsappNumber;
  dynamic dateOfBirth;
  String? leadOwner;
  dynamic leadGroup;
  String? status;
  dynamic taluk;
  dynamic talukName;
  dynamic attendance;
  dynamic previousLead;
  dynamic fatherOrHusbandName;
  dynamic salutation;
  dynamic designation;
  dynamic gender;
  String? typeOfOrganization;
  dynamic source;
  String? currentStatus;
  dynamic customer;
  dynamic campaignName;
  dynamic date;
  String? image;
  dynamic boardName;
  dynamic category;
  dynamic schemeName;
  dynamic subsidyPercent;
  dynamic subsidyAmount;
  dynamic contactBy;
  dynamic escalationManager;
  dynamic contactDate;
  dynamic endsOn;
  dynamic scheme;
  dynamic dealer;
  String? subsidy;
  dynamic category1;
  dynamic circle;
  dynamic section;
  dynamic roofType1;
  String? averageElectricityBill;
  dynamic averageElectricityBills;
  dynamic buildingType1;
  dynamic subsidyPercentage;
  dynamic notes;
  String? addressLink;
  dynamic contactLink;
  String? addressType;
  dynamic addressTitle;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic city;
  dynamic county;
  dynamic state;
  String? country;
  dynamic pincode;
  dynamic phone;
  dynamic mobileNo;
  dynamic deale;
  dynamic fax;
  dynamic website;
  dynamic schem;
  String? subsidy2;
  dynamic fetchCurrentLocation;
  dynamic latitude;
  dynamic longitude;
  dynamic area;
  dynamic place;
  String? type;
  dynamic category3;
  dynamic roofType3;
  String? averageElectricityBill1;
  dynamic averagesElectricityBill;
  dynamic connectionType;
  dynamic connectedLoad;
  dynamic buildingType3;
  dynamic marketSegment;
  dynamic industry;
  String? requestType;
  String? leadStatus;
  dynamic postingDate;
  dynamic images;
  String? company;
  dynamic proposedProjectCapacity;
  dynamic territory;
  String? language;
  dynamic unsubscribed;
  dynamic blogSubscriber;
  String? title;
  dynamic cnot;
  dynamic enot;
  dynamic lownot;
  String? doctype;

  Data({
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
    this.organizationLead,
    this.emiCustomer,
    this.bankLoanProvider,
    this.namingSeries,
    this.leadName,
    this.companyName,
    this.leadCategory,
    this.aadhaarNumber,
    this.emailId,
    this.itemName,
    this.district,
    this.districtName,
    this.ldSource,
    this.leadSourceName,
    this.consumerNumber,
    this.numberToBeContacted,
    this.whatsappNumber,
    this.dateOfBirth,
    this.leadOwner,
    this.leadGroup,
    this.status,
    this.taluk,
    this.talukName,
    this.attendance,
    this.previousLead,
    this.fatherOrHusbandName,
    this.salutation,
    this.designation,
    this.gender,
    this.typeOfOrganization,
    this.source,
    this.currentStatus,
    this.customer,
    this.campaignName,
    this.date,
    this.image,
    this.boardName,
    this.category,
    this.schemeName,
    this.subsidyPercent,
    this.subsidyAmount,
    this.contactBy,
    this.escalationManager,
    this.contactDate,
    this.endsOn,
    this.scheme,
    this.dealer,
    this.subsidy,
    this.category1,
    this.circle,
    this.section,
    this.roofType1,
    this.averageElectricityBill,
    this.averageElectricityBills,
    this.buildingType1,
    this.subsidyPercentage,
    this.notes,
    this.addressLink,
    this.contactLink,
    this.addressType,
    this.addressTitle,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.county,
    this.state,
    this.country,
    this.pincode,
    this.phone,
    this.mobileNo,
    this.deale,
    this.fax,
    this.website,
    this.schem,
    this.subsidy2,
    this.fetchCurrentLocation,
    this.latitude,
    this.longitude,
    this.area,
    this.place,
    this.type,
    this.category3,
    this.roofType3,
    this.averageElectricityBill1,
    this.averagesElectricityBill,
    this.connectionType,
    this.connectedLoad,
    this.buildingType3,
    this.marketSegment,
    this.industry,
    this.requestType,
    this.leadStatus,
    this.postingDate,
    this.images,
    this.company,
    this.proposedProjectCapacity,
    this.territory,
    this.language,
    this.unsubscribed,
    this.blogSubscriber,
    this.title,
    this.cnot,
    this.enot,
    this.lownot,
    this.doctype,
  });

  Data.fromJson(Map<String, dynamic> json) {
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
    organizationLead = json['organization_lead'];
    emiCustomer = json['emi_customer'];
    bankLoanProvider = json['bank_loan_provider'];
    namingSeries = json['naming_series'];
    leadName = json['lead_name'];
    companyName = json['company_name'];
    leadCategory = json['lead_category'];
    aadhaarNumber = json['aadhaar_number'];
    emailId = json['email_id'];
    itemName = json['item_name'];
    district = json['district'];
    districtName = json['district_name'];
    ldSource = json['ld_source'];
    leadSourceName = json['lead_source_name'];
    consumerNumber = json['consumer_number'];
    numberToBeContacted = json['number_to_be_contacted'];
    whatsappNumber = json['whatsapp_number'];
    dateOfBirth = json['date_of_birth'];
    leadOwner = json['lead_owner'];
    leadGroup = json['lead_group'];
    status = json['status'];
    taluk = json['taluk'];
    talukName = json['taluk_name'];
    attendance = json['attendance'];
    previousLead = json['previous_lead'];
    fatherOrHusbandName = json['father_or_husband_name'];
    salutation = json['salutation'];
    designation = json['designation'];
    gender = json['gender'];
    typeOfOrganization = json['type_of_organization'];
    source = json['source'];
    currentStatus = json['current_status'];
    customer = json['customer'];
    campaignName = json['campaign_name'];
    date = json['date'];
    image = json['image'];
    boardName = json['board_name'];
    category = json['category'];
    schemeName = json['scheme_name'];
    subsidyPercent = json['subsidy_percent'];
    subsidyAmount = json['subsidy_amount'];
    contactBy = json['contact_by'];
    escalationManager = json['escalation_manager'];
    contactDate = json['contact_date'];
    endsOn = json['ends_on'];
    scheme = json['scheme'];
    dealer = json['dealer'];
    subsidy = json['subsidy'];
    category1 = json['category1'];
    circle = json['circle'];
    section = json['section'];
    roofType1 = json['roof_type1'];
    averageElectricityBill = json['average_electricity_bill'];
    averageElectricityBills = json['average_electricity_bills'];
    buildingType1 = json['building_type1'];
    subsidyPercentage = json['subsidy_percentage'];
    notes = json['notes'];
    addressLink = json['address_link'];
    contactLink = json['contact_link'];
    addressType = json['address_type'];
    addressTitle = json['address_title'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    city = json['city'];
    county = json['county'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    phone = json['phone'];
    mobileNo = json['mobile_no'];
    deale = json['deale'];
    fax = json['fax'];
    website = json['website'];
    schem = json['schem'];
    subsidy2 = json['subsidy2'];
    fetchCurrentLocation = json['fetch_current_location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    area = json['area'];
    place = json['place'];
    type = json['type'];
    category3 = json['category3'];
    roofType3 = json['roof_type3'];
    averageElectricityBill1 = json['average_electricity_bill1'];
    averagesElectricityBill = json['averages_electricity_bill'];
    connectionType = json['connection_type'];
    connectedLoad = json['connected_load'];
    buildingType3 = json['building_type3'];
    marketSegment = json['market_segment'];
    industry = json['industry'];
    requestType = json['request_type'];
    leadStatus = json['lead_status'];
    postingDate = json['posting_date'];
    images = json['images'];
    company = json['company'];
    proposedProjectCapacity = json['proposed_project_capacity'];
    territory = json['territory'];
    language = json['language'];
    unsubscribed = json['unsubscribed'];
    blogSubscriber = json['blog_subscriber'];
    title = json['title'];
    cnot = json['cnot'];
    enot = json['enot'];
    lownot = json['lownot'];
    doctype = json['doctype'];
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
    data['organization_lead'] = organizationLead;
    data['emi_customer'] = emiCustomer;
    data['bank_loan_provider'] = bankLoanProvider;
    data['naming_series'] = namingSeries;
    data['lead_name'] = leadName;
    data['company_name'] = companyName;
    data['lead_category'] = leadCategory;
    data['aadhaar_number'] = aadhaarNumber;
    data['email_id'] = emailId;
    data['item_name'] = itemName;
    data['district'] = district;
    data['district_name'] = districtName;
    data['ld_source'] = ldSource;
    data['lead_source_name'] = leadSourceName;
    data['consumer_number'] = consumerNumber;
    data['number_to_be_contacted'] = numberToBeContacted;
    data['whatsapp_number'] = whatsappNumber;
    data['date_of_birth'] = dateOfBirth;
    data['lead_owner'] = leadOwner;
    data['lead_group'] = leadGroup;
    data['status'] = status;
    data['taluk'] = taluk;
    data['taluk_name'] = talukName;
    data['attendance'] = attendance;
    data['previous_lead'] = previousLead;
    data['father_or_husband_name'] = fatherOrHusbandName;
    data['salutation'] = salutation;
    data['designation'] = designation;
    data['gender'] = gender;
    data['type_of_organization'] = typeOfOrganization;
    data['source'] = source;
    data['current_status'] = currentStatus;
    data['customer'] = customer;
    data['campaign_name'] = campaignName;
    data['date'] = date;
    data['image'] = image;
    data['board_name'] = boardName;
    data['category'] = category;
    data['scheme_name'] = schemeName;
    data['subsidy_percent'] = subsidyPercent;
    data['subsidy_amount'] = subsidyAmount;
    data['contact_by'] = contactBy;
    data['escalation_manager'] = escalationManager;
    data['contact_date'] = contactDate;
    data['ends_on'] = endsOn;
    data['scheme'] = scheme;
    data['dealer'] = dealer;
    data['subsidy'] = subsidy;
    data['category1'] = category1;
    data['circle'] = circle;
    data['section'] = section;
    data['roof_type1'] = roofType1;
    data['average_electricity_bill'] = averageElectricityBill;
    data['average_electricity_bills'] = averageElectricityBills;
    data['building_type1'] = buildingType1;
    data['subsidy_percentage'] = subsidyPercentage;
    data['notes'] = notes;
    data['address_link'] = addressLink;
    data['contact_link'] = contactLink;
    data['address_type'] = addressType;
    data['address_title'] = addressTitle;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['city'] = city;
    data['county'] = county;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['phone'] = phone;
    data['mobile_no'] = mobileNo;
    data['deale'] = deale;
    data['fax'] = fax;
    data['website'] = website;
    data['schem'] = schem;
    data['subsidy2'] = subsidy2;
    data['fetch_current_location'] = fetchCurrentLocation;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['area'] = area;
    data['place'] = place;
    data['type'] = type;
    data['category3'] = category3;
    data['roof_type3'] = roofType3;
    data['average_electricity_bill1'] = averageElectricityBill1;
    data['averages_electricity_bill'] = averagesElectricityBill;
    data['connection_type'] = connectionType;
    data['connected_load'] = connectedLoad;
    data['building_type3'] = buildingType3;
    data['market_segment'] = marketSegment;
    data['industry'] = industry;
    data['request_type'] = requestType;
    data['lead_status'] = leadStatus;
    data['posting_date'] = postingDate;
    data['images'] = images;
    data['company'] = company;
    data['proposed_project_capacity'] = proposedProjectCapacity;
    data['territory'] = territory;
    data['language'] = language;
    data['unsubscribed'] = unsubscribed;
    data['blog_subscriber'] = blogSubscriber;
    data['title'] = title;
    data['cnot'] = cnot;
    data['enot'] = enot;
    data['lownot'] = lownot;
    data['doctype'] = doctype;
    return data;
  }
}
