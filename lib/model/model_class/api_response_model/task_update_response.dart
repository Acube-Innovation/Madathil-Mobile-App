class TaskUpdateResponse {
  Data? data;

  TaskUpdateResponse({this.data});

  TaskUpdateResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic idx;
  dynamic docstatus;
  String? subject;
  dynamic showToCustomer;
  String? assignedUser;
  String? type;
  dynamic isCompleted;
  dynamic isGroup;
  dynamic isTemplate;
  dynamic isOld;
  dynamic isProcessStatus;
  String? paymentDependence;
  String? paymentStatus;
  String? status;
  String? priority;
  dynamic taskWeight;
  dynamic isCustomerPayment;
  dynamic cashReceived;
  String? completedOn;
  dynamic expectedTime;
  dynamic start;
  String? expEndDate;
  dynamic progress;
  dynamic duration;
  dynamic isMilestone;
  String? description;
  String? dependsOnTasks;
  dynamic actualTime;
  dynamic totalCostingAmount;
  dynamic totalExpenseClaim;
  dynamic totalBillingAmount;
  dynamic numberOfAttachmentsAllowed;
  String? company;
  dynamic lft;
  dynamic rgt;
  String? oldParent;
  String? totalAttachments;
  dynamic on;
  String? doctype;

  Data(
      {this.name,
      this.owner,
      this.creation,
      this.modified,
      this.modifiedBy,
      this.idx,
      this.docstatus,
      this.subject,
      this.showToCustomer,
      this.assignedUser,
      this.type,
      this.isCompleted,
      this.isGroup,
      this.isTemplate,
      this.isOld,
      this.isProcessStatus,
      this.paymentDependence,
      this.paymentStatus,
      this.status,
      this.priority,
      this.taskWeight,
      this.isCustomerPayment,
      this.cashReceived,
      this.completedOn,
      this.expectedTime,
      this.start,
      this.expEndDate,
      this.progress,
      this.duration,
      this.isMilestone,
      this.description,
      this.dependsOnTasks,
      this.actualTime,
      this.totalCostingAmount,
      this.totalExpenseClaim,
      this.totalBillingAmount,
      this.numberOfAttachmentsAllowed,
      this.company,
      this.lft,
      this.rgt,
      this.oldParent,
      this.totalAttachments,
      this.on,
      this.doctype});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    subject = json['subject'];
    showToCustomer = json['show_to_customer'];
    assignedUser = json['assigned_user'];
    type = json['type'];
    isCompleted = json['is_completed'];
    isGroup = json['is_group'];
    isTemplate = json['is_template'];
    isOld = json['is_old'];
    isProcessStatus = json['is_process_status'];
    paymentDependence = json['payment_dependence'];
    paymentStatus = json['payment_status'];
    status = json['status'];
    priority = json['priority'];
    taskWeight = json['task_weight'];
    isCustomerPayment = json['is_customer_payment'];
    cashReceived = json['cash_received'];
    completedOn = json['completed_on'];
    expectedTime = json['expected_time'];
    start = json['start'];
    expEndDate = json['exp_end_date'];
    progress = json['progress'];
    duration = json['duration'];
    isMilestone = json['is_milestone'];
    description = json['description'];
    dependsOnTasks = json['depends_on_tasks'];
    actualTime = json['actual_time'];
    totalCostingAmount = json['total_costing_amount'];
    totalExpenseClaim = json['total_expense_claim'];
    totalBillingAmount = json['total_billing_amount'];
    numberOfAttachmentsAllowed = json['number_of_attachments_allowed'];
    company = json['company'];
    lft = json['lft'];
    rgt = json['rgt'];
    oldParent = json['old_parent'];
    totalAttachments = json['total_attachments'];
    on = json['on'];
    doctype = json['doctype'];
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
    data['subject'] = subject;
    data['show_to_customer'] = showToCustomer;
    data['assigned_user'] = assignedUser;
    data['type'] = type;
    data['is_completed'] = isCompleted;
    data['is_group'] = isGroup;
    data['is_template'] = isTemplate;
    data['is_old'] = isOld;
    data['is_process_status'] = isProcessStatus;
    data['payment_dependence'] = paymentDependence;
    data['payment_status'] = paymentStatus;
    data['status'] = status;
    data['priority'] = priority;
    data['task_weight'] = taskWeight;
    data['is_customer_payment'] = isCustomerPayment;
    data['cash_received'] = cashReceived;
    data['completed_on'] = completedOn;
    data['expected_time'] = expectedTime;
    data['start'] = start;
    data['exp_end_date'] = expEndDate;
    data['progress'] = progress;
    data['duration'] = duration;
    data['is_milestone'] = isMilestone;
    data['description'] = description;
    data['depends_on_tasks'] = dependsOnTasks;
    data['actual_time'] = actualTime;
    data['total_costing_amount'] = totalCostingAmount;
    data['total_expense_claim'] = totalExpenseClaim;
    data['total_billing_amount'] = totalBillingAmount;
    data['number_of_attachments_allowed'] = numberOfAttachmentsAllowed;
    data['company'] = company;
    data['lft'] = lft;
    data['rgt'] = rgt;
    data['old_parent'] = oldParent;
    data['total_attachments'] = totalAttachments;
    data['on'] = on;
    data['doctype'] = doctype;
    return data;
  }
}
