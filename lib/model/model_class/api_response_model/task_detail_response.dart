class TasksDetailsResponse {
  Data? data;

  TasksDetailsResponse({this.data});

  TasksDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? subject;
  int? showToCustomer;
  String? assignedUser;
  int? isCompleted;
  int? isGroup;
  int? isTemplate;
  int? isOld;
  int? isProcessStatus;
  String? paymentDependence;
  String? paymentStatus;
  String? status;
  String? priority;
  double? taskWeight;
  int? isCustomerPayment;
  double? cashReceived;
  String? completedOn;
  double? expectedTime;
  int? start;
  double? progress;
  String? description;
  int? duration;
  int? isMilestone;
  String? dependsOnTasks;
  double? actualTime;
  double? totalCostingAmount;
  double? totalExpenseClaim;
  double? totalBillingAmount;
  String? orderNumber;
  int? numberOfAttachmentsAllowed;
  String? company;
  int? lft;
  int? rgt;
  String? oldParent;
  String? totalAttachments;
  int? on;
  String? doctype;
  List<TaskUsers>? taskUsers;

  Data({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.description,
    this.idx,
    this.type,
    this.docstatus,
    this.subject,
    this.showToCustomer,
    this.assignedUser,
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
    this.progress,
    this.duration,
    this.isMilestone,
    this.dependsOnTasks,
    this.actualTime,
    this.totalCostingAmount,
    this.totalExpenseClaim,
    this.totalBillingAmount,
    this.orderNumber,
    this.numberOfAttachmentsAllowed,
    this.company,
    this.lft,
    this.rgt,
    this.oldParent,
    this.totalAttachments,
    this.on,
    this.doctype,
    this.taskUsers,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    idx = json['idx'];
    type = json['type'];
    description = json['description'];
    docstatus = json['docstatus'];
    subject = json['subject'];
    showToCustomer = json['show_to_customer'];
    assignedUser = json['assigned_user'];
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
    progress = json['progress'];
    duration = json['duration'];
    isMilestone = json['is_milestone'];
    dependsOnTasks = json['depends_on_tasks'];
    actualTime = json['actual_time'];
    totalCostingAmount = json['total_costing_amount'];
    totalExpenseClaim = json['total_expense_claim'];
    totalBillingAmount = json['total_billing_amount'];
    orderNumber = json['order_number'];
    numberOfAttachmentsAllowed = json['number_of_attachments_allowed'];
    company = json['company'];
    lft = json['lft'];
    rgt = json['rgt'];
    oldParent = json['old_parent'];
    totalAttachments = json['total_attachments'];
    on = json['on'];
    doctype = json['doctype'];
    if (json['task_users'] != null) {
      taskUsers = <TaskUsers>[];
      json['task_users'].forEach((v) {
        taskUsers!.add(TaskUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner'] = owner;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['idx'] = idx;
    data['type'] = type;
    data['docstatus'] = docstatus;
    data['subject'] = subject;
    data['description'] = description;
    data['show_to_customer'] = showToCustomer;
    data['assigned_user'] = assignedUser;
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
    data['progress'] = progress;
    data['duration'] = duration;
    data['is_milestone'] = isMilestone;
    data['depends_on_tasks'] = dependsOnTasks;
    data['actual_time'] = actualTime;
    data['total_costing_amount'] = totalCostingAmount;
    data['total_expense_claim'] = totalExpenseClaim;
    data['total_billing_amount'] = totalBillingAmount;
    data['order_number'] = orderNumber;
    data['number_of_attachments_allowed'] = numberOfAttachmentsAllowed;
    data['company'] = company;
    data['lft'] = lft;
    data['rgt'] = rgt;
    data['old_parent'] = oldParent;
    data['total_attachments'] = totalAttachments;
    data['on'] = on;
    data['doctype'] = doctype;
    if (taskUsers != null) {
      data['task_users'] = taskUsers!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class TaskUsers {
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
  String? userName;
  String? doctype;

  TaskUsers(
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
      this.userName,
      this.doctype});

  TaskUsers.fromJson(Map<String, dynamic> json) {
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
    userName = json['user_name'];
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
    data['user_name'] = userName;
    data['doctype'] = doctype;
    return data;
  }
}
