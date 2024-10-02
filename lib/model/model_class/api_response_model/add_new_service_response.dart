class AddNewServiceResponse {
  Data? data;

  AddNewServiceResponse({this.data});

  AddNewServiceResponse.fromJson(Map<String, dynamic> json) {
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
  String? parent;
  String? parentfield;
  String? parenttype;
  int? idx;
  int? docstatus;
  String? namingSeries;
  String? customer;
  String? customerName;
  String? addressDisplay;
  String? contactDisplay;
  String? contactMobile;
  String? contactEmail;
  String? maintenanceSchedule;
  String? maintenanceScheduleDetail;
  String? mntcDate;
  String? mntcTime;
  String? completionStatus;
  String? workCompletionStatus;
  String? maintenanceType;
  String? customerFeedback;
  String? status;
  String? amendedFrom;
  String? company;
  String? sendNotificationTo;
  String? customerAddress;
  String? contactPerson;
  String? territory;
  String? customerGroup;
  String? doctype;
  List<Purposes>? purposes;

  Data(
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
      this.namingSeries,
      this.customer,
      this.customerName,
      this.addressDisplay,
      this.contactDisplay,
      this.contactMobile,
      this.contactEmail,
      this.maintenanceSchedule,
      this.maintenanceScheduleDetail,
      this.mntcDate,
      this.mntcTime,
      this.completionStatus,
      this.workCompletionStatus,
      this.maintenanceType,
      this.customerFeedback,
      this.status,
      this.amendedFrom,
      this.company,
      this.sendNotificationTo,
      this.customerAddress,
      this.contactPerson,
      this.territory,
      this.customerGroup,
      this.doctype,
      this.purposes});

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
    namingSeries = json['naming_series'];
    customer = json['customer'];
    customerName = json['customer_name'];
    addressDisplay = json['address_display'];
    contactDisplay = json['contact_display'];
    contactMobile = json['contact_mobile'];
    contactEmail = json['contact_email'];
    maintenanceSchedule = json['maintenance_schedule'];
    maintenanceScheduleDetail = json['maintenance_schedule_detail'];
    mntcDate = json['mntc_date'];
    mntcTime = json['mntc_time'];
    completionStatus = json['completion_status'];
    workCompletionStatus = json['work_completion_status'];
    maintenanceType = json['maintenance_type'];
    customerFeedback = json['customer_feedback'];
    status = json['status'];
    amendedFrom = json['amended_from'];
    company = json['company'];
    sendNotificationTo = json['send_notification_to'];
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
    data['parent'] = this.parent;
    data['parentfield'] = this.parentfield;
    data['parenttype'] = this.parenttype;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['naming_series'] = this.namingSeries;
    data['customer'] = this.customer;
    data['customer_name'] = this.customerName;
    data['address_display'] = this.addressDisplay;
    data['contact_display'] = this.contactDisplay;
    data['contact_mobile'] = this.contactMobile;
    data['contact_email'] = this.contactEmail;
    data['maintenance_schedule'] = this.maintenanceSchedule;
    data['maintenance_schedule_detail'] = this.maintenanceScheduleDetail;
    data['mntc_date'] = this.mntcDate;
    data['mntc_time'] = this.mntcTime;
    data['completion_status'] = this.completionStatus;
    data['work_completion_status'] = this.workCompletionStatus;
    data['maintenance_type'] = this.maintenanceType;
    data['customer_feedback'] = this.customerFeedback;
    data['status'] = this.status;
    data['amended_from'] = this.amendedFrom;
    data['company'] = this.company;
    data['send_notification_to'] = this.sendNotificationTo;
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
  String? serialNo;
  String? description;
  String? workDone;
  String? prevdocDoctype;
  String? prevdocDocname;
  String? doctype;
  int? iUnsaved;

  Purposes(
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
      this.itemCode,
      this.itemName,
      this.servicePerson,
      this.serialNo,
      this.description,
      this.workDone,
      this.prevdocDoctype,
      this.prevdocDocname,
      this.doctype,
      this.iUnsaved});

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
    serialNo = json['serial_no'];
    description = json['description'];
    workDone = json['work_done'];
    prevdocDoctype = json['prevdoc_doctype'];
    prevdocDocname = json['prevdoc_docname'];
    doctype = json['doctype'];
    iUnsaved = json['__unsaved'];
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
    data['serial_no'] = this.serialNo;
    data['description'] = this.description;
    data['work_done'] = this.workDone;
    data['prevdoc_doctype'] = this.prevdocDoctype;
    data['prevdoc_docname'] = this.prevdocDocname;
    data['doctype'] = this.doctype;
    data['__unsaved'] = this.iUnsaved;
    return data;
  }
}
