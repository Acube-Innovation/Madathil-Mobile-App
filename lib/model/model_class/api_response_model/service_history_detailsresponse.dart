class ServiceHistoryDetailsResponse {
  ServiceHistoryDetails? data;

  ServiceHistoryDetailsResponse({this.data});

  ServiceHistoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? ServiceHistoryDetails.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ServiceHistoryDetails {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? namingSeries;
  String? customer;
  String? customerName;
  String? addressDisplay;
  String? contactDisplay;
  String? contactMobile;
  String? contactEmail;
  String? mntcDate;
  String? mntcTime;
  String? completionStatus;
  String? workCompletionStatus;
  String? maintenanceType;
  String? customerFeedback;
  String? status;
  String? company;
  String? customerAddress;
  String? contactPerson;
  String? territory;
  String? customerGroup;
  String? doctype;
  List<Purposes>? purposes;

  ServiceHistoryDetails({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.idx,
    this.docstatus,
    this.namingSeries,
    this.customer,
    this.customerName,
    this.addressDisplay,
    this.contactDisplay,
    this.contactMobile,
    this.contactEmail,
    this.mntcDate,
    this.mntcTime,
    this.completionStatus,
    this.workCompletionStatus,
    this.maintenanceType,
    this.customerFeedback,
    this.status,
    this.company,
    this.customerAddress,
    this.contactPerson,
    this.territory,
    this.customerGroup,
    this.doctype,
    this.purposes,
  });

  ServiceHistoryDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    namingSeries = json['naming_series'];
    customer = json['customer'];
    customerName = json['customer_name'];
    addressDisplay = json['address_display'];
    contactDisplay = json['contact_display'];
    contactMobile = json['contact_mobile'];
    contactEmail = json['contact_email'];
    mntcDate = json['mntc_date'];
    mntcTime = json['mntc_time'];
    completionStatus = json['completion_status'];
    workCompletionStatus = json['work_completion_status'];
    maintenanceType = json['maintenance_type'];
    customerFeedback = json['customer_feedback'];
    status = json['status'];
    company = json['company'];
    customerAddress = json['customer_address'];
    contactPerson = json['contact_person'];
    territory = json['territory'];
    customerGroup = json['customer_group'];
    doctype = json['doctype'];
    if (json['purposes'] != null) {
      purposes = <Purposes>[];
      json['purposes'].forEach((v) {
        purposes!.add(Purposes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['naming_series'] = this.namingSeries;
    data['customer'] = this.customer;
    data['customer_name'] = this.customerName;
    data['address_display'] = this.addressDisplay;
    data['contact_display'] = this.contactDisplay;
    data['contact_mobile'] = this.contactMobile;
    data['contact_email'] = this.contactEmail;
    data['mntc_date'] = this.mntcDate;
    data['mntc_time'] = this.mntcTime;
    data['completion_status'] = this.completionStatus;
    data['work_completion_status'] = this.workCompletionStatus;
    data['maintenance_type'] = this.maintenanceType;
    data['customer_feedback'] = this.customerFeedback;
    data['status'] = this.status;
    data['company'] = this.company;
    data['customer_address'] = this.customerAddress;
    data['contact_person'] = this.contactPerson;
    data['territory'] = this.territory;
    data['customer_group'] = this.customerGroup;
    data['doctype'] = this.doctype;
    if (this.purposes != null) {
      data['purposes'] = this.purposes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Purposes {
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
  String? itemCode;
  String? itemName;
  String? servicePerson;
  String? description;
  String? workDone;
  String? doctype;

  Purposes({
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
    this.itemCode,
    this.itemName,
    this.servicePerson,
    this.description,
    this.workDone,
    this.doctype,
  });

  Purposes.fromJson(Map<String, dynamic> json) {
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
    itemCode = json['item_code'];
    itemName = json['item_name'];
    servicePerson = json['service_person'];
    description = json['description'];
    workDone = json['work_done'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['parent'] = this.parent;
    data['parentfield'] = this.parentfield;
    data['parenttype'] = this.parenttype;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['item_code'] = this.itemCode;
    data['item_name'] = this.itemName;
    data['service_person'] = this.servicePerson;
    data['description'] = this.description;
    data['work_done'] = this.workDone;
    data['doctype'] = this.doctype;
    return data;
  }
}
