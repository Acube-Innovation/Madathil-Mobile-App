class EmployeeDetailsResponse {
  EmployeeData? data;

  EmployeeDetailsResponse({this.data});

  EmployeeDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? EmployeeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class EmployeeData {
  String? name;
  String? owner;
  String? creation;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? employee;
  String? namingSeries;
  String? image;
  String? firstName;
  String? middleName;
  String? lastName;
  String? employeeName;
  String? company;
  String? status;
  String? gender;
  String? dateOfBirth;
  String? dateOfJoining;
  int? dealer;
  String? userId;
  int? createUserPermission;
  int? noticeNumberOfDays;
  String? dateOfRetirement;
  String? department;
  String? designation;
  String? employeeZone;
  String? employeeRegion;
  String? employeeArea;
  String? reportsTo;
  String? zone;
  String? salaryMode;
  String? cellNumber;
  String? preferedEmail;
  int? unsubscribed;
  String? permanentAccommodationType;
  String? permanentAddress;
  String? preferedContactEmail;
  String? companyEmail;
  String? currentAccommodationType;
  String? currentAddress;
  String? maritalStatus;
  String? bloodGroup;
  String? leaveEncashed;
  int? lft;
  int? rgt;
  String? oldParent;
  String? doctype;
  List<dynamic>? education;
  List<dynamic>? externalWorkHistory;
  List<dynamic>? internalWorkHistory;

  EmployeeData({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.idx,
    this.docstatus,
    this.image,
    this.employee,
    this.namingSeries,
    this.firstName,
    this.middleName,
    this.lastName,
    this.employeeName,
    this.company,
    this.status,
    this.gender,
    this.dateOfBirth,
    this.dateOfJoining,
    this.dealer,
    this.userId,
    this.createUserPermission,
    this.noticeNumberOfDays,
    this.dateOfRetirement,
    this.department,
    this.designation,
    this.employeeZone,
    this.employeeRegion,
    this.employeeArea,
    this.reportsTo,
    this.zone,
    this.salaryMode,
    this.cellNumber,
    this.preferedEmail,
    this.unsubscribed,
    this.permanentAccommodationType,
    this.permanentAddress,
    this.preferedContactEmail,
    this.companyEmail,
    this.currentAccommodationType,
    this.currentAddress,
    this.maritalStatus,
    this.bloodGroup,
    this.leaveEncashed,
    this.lft,
    this.rgt,
    this.oldParent,
    this.doctype,
    this.education,
    this.externalWorkHistory,
    this.internalWorkHistory,
  });

  EmployeeData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    employee = json['employee'];
    namingSeries = json['naming_series'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    employeeName = json['employee_name'];
    company = json['company'];
    status = json['status'];
    gender = json['gender'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    dateOfJoining = json['date_of_joining'];
    dealer = json['dealer'];
    userId = json['user_id'];
    createUserPermission = json['create_user_permission'];
    noticeNumberOfDays = json['notice_number_of_days'];
    dateOfRetirement = json['date_of_retirement'];
    department = json['department'];
    designation = json['designation'];
    employeeZone = json['employee_zone'];
    employeeRegion = json['employee_region'];
    employeeArea = json['employee_area'];
    reportsTo = json['reports_to'];
    zone = json['zone'];
    salaryMode = json['salary_mode'];
    cellNumber = json['cell_number'];
    preferedEmail = json['prefered_email'];
    unsubscribed = json['unsubscribed'];
    permanentAccommodationType = json['permanent_accommodation_type'];
    permanentAddress = json['permanent_address'];
    preferedContactEmail = json['prefered_contact_email'];
    companyEmail = json['company_email'];
    currentAccommodationType = json['current_accommodation_type'];
    currentAddress = json['current_address'];
    maritalStatus = json['marital_status'];
    bloodGroup = json['blood_group'];
    leaveEncashed = json['leave_encashed'];
    lft = json['lft'];
    rgt = json['rgt'];
    oldParent = json['old_parent'];
    doctype = json['doctype'];
    education = json['education'];
    externalWorkHistory = json['external_work_history'];
    internalWorkHistory = json['internal_work_history'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['creation'] = this.creation;
    data['modified'] = this.modified;
    data['modified_by'] = this.modifiedBy;
    data['idx'] = this.idx;
    data['docstatus'] = this.docstatus;
    data['image'] = this.image;
    data['employee'] = this.employee;
    data['naming_series'] = this.namingSeries;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['employee_name'] = this.employeeName;
    data['company'] = this.company;
    data['status'] = this.status;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['date_of_joining'] = this.dateOfJoining;
    data['dealer'] = this.dealer;
    data['user_id'] = this.userId;
    data['create_user_permission'] = this.createUserPermission;
    data['notice_number_of_days'] = this.noticeNumberOfDays;
    data['date_of_retirement'] = this.dateOfRetirement;
    data['department'] = this.department;
    data['designation'] = this.designation;
    data['employee_zone'] = this.employeeZone;
    data['employee_region'] = this.employeeRegion;
    data['employee_area'] = this.employeeArea;
    data['reports_to'] = this.reportsTo;
    data['zone'] = this.zone;
    data['salary_mode'] = this.salaryMode;
    data['cell_number'] = this.cellNumber;
    data['prefered_email'] = this.preferedEmail;
    data['unsubscribed'] = this.unsubscribed;
    data['permanent_accommodation_type'] = this.permanentAccommodationType;
    data['permanent_address'] = this.permanentAddress;
    data['prefered_contact_email'] = this.preferedContactEmail;
    data['company_email'] = this.companyEmail;
    data['current_accommodation_type'] = this.currentAccommodationType;
    data['current_address'] = this.currentAddress;
    data['marital_status'] = this.maritalStatus;
    data['blood_group'] = this.bloodGroup;
    data['leave_encashed'] = this.leaveEncashed;
    data['lft'] = this.lft;
    data['rgt'] = this.rgt;
    data['old_parent'] = this.oldParent;
    data['doctype'] = this.doctype;
    if (this.education != null) {
      data['education'] = this.education;
    }
    if (this.externalWorkHistory != null) {
      data['external_work_history'] = this.externalWorkHistory;
    }
    if (this.internalWorkHistory != null) {
      data['internal_work_history'] = this.internalWorkHistory;
    }
    return data;
  }
}
