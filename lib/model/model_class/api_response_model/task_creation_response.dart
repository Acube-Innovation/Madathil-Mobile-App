class TasksCreationResponse {
  Data? data;

  TasksCreationResponse({this.data});

  TasksCreationResponse.fromJson(Map<String, dynamic> json) {
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
  int? idx;
  int? docstatus;
  dynamic githubSyncId;
  String? subject;
  int? showToCustomer;
  dynamic project;
  dynamic projectId;
  dynamic customer;
  dynamic contactNumber;
  dynamic consumerNumber;
  dynamic fileNumber;
  dynamic whatsappNumber;
  String? assignedUser;
  dynamic issue;
  String? type;
  dynamic color;
  dynamic leadId;
  dynamic opportunity;
  dynamic quotation;
  dynamic salesOrder;
  dynamic salesInvoice;
  dynamic materialRequest;
  dynamic purchaseOrder;
  dynamic purchaseInvoice;
  dynamic pI;
  dynamic purchaseReceipt;
  int? isCompleted;
  int? isGroup;
  int? isTemplate;
  int? isOld;
  int? isProcessStatus;
  String? paymentDependence;
  String? paymentStatus;
  String? status;
  String? priority;
  int? taskWeight;
  dynamic parentTask;
  dynamic completedBy;
  int? isCustomerPayment;
  dynamic doctypesName;
  dynamic dId;
  dynamic message;
  dynamic modeOfPayment;
  int? cashReceived;
  dynamic location;
  String? completedOn;
  dynamic latitude;
  dynamic longitude;
  dynamic city;
  dynamic state;
  dynamic area;
  String? expStartDate;
  int? expectedTime;
  int? start;
  String? expEndDate;
  int? progress;
  int? duration;
  int? isMilestone;
  String? description;
  String? dependsOnTasks;
  dynamic actStartDate;
  int? actualTime;
  dynamic actEndDate;
  int? totalCostingAmount;
  int? totalExpenseClaim;
  int? totalBillingAmount;
  dynamic reviewDate;
  dynamic closingDate;
  dynamic orderNumber;
  int? numberOfAttachmentsAllowed;
  dynamic department;
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
    this.parent,
    this.parentfield,
    this.parenttype,
    this.idx,
    this.docstatus,
    this.githubSyncId,
    this.subject,
    this.showToCustomer,
    this.project,
    this.projectId,
    this.customer,
    this.contactNumber,
    this.consumerNumber,
    this.fileNumber,
    this.whatsappNumber,
    this.assignedUser,
    this.issue,
    this.type,
    this.color,
    this.leadId,
    this.opportunity,
    this.quotation,
    this.salesOrder,
    this.salesInvoice,
    this.materialRequest,
    this.purchaseOrder,
    this.purchaseInvoice,
    this.pI,
    this.purchaseReceipt,
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
    this.parentTask,
    this.completedBy,
    this.isCustomerPayment,
    this.doctypesName,
    this.dId,
    this.message,
    this.modeOfPayment,
    this.cashReceived,
    this.location,
    this.completedOn,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.area,
    this.expStartDate,
    this.expectedTime,
    this.start,
    this.expEndDate,
    this.progress,
    this.duration,
    this.isMilestone,
    this.description,
    this.dependsOnTasks,
    this.actStartDate,
    this.actualTime,
    this.actEndDate,
    this.totalCostingAmount,
    this.totalExpenseClaim,
    this.totalBillingAmount,
    this.reviewDate,
    this.closingDate,
    this.orderNumber,
    this.numberOfAttachmentsAllowed,
    this.department,
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
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    idx = json['idx'];
    docstatus = json['docstatus'];
    githubSyncId = json['github_sync_id'];
    subject = json['subject'];
    showToCustomer = json['show_to_customer'];
    project = json['project'];
    projectId = json['project_id'];
    customer = json['customer'];
    contactNumber = json['contact_number'];
    consumerNumber = json['consumer_number'];
    fileNumber = json['file_number'];
    whatsappNumber = json['whatsapp_number'];
    assignedUser = json['assigned_user'];
    issue = json['issue'];
    type = json['type'];
    color = json['color'];
    leadId = json['lead_id'];
    opportunity = json['opportunity'];
    quotation = json['quotation'];
    salesOrder = json['sales_order'];
    salesInvoice = json['sales_invoice'];
    materialRequest = json['material_request'];
    purchaseOrder = json['purchase_order'];
    purchaseInvoice = json['purchase_invoice'];
    pI = json['p_i'];
    purchaseReceipt = json['purchase_receipt'];
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
    parentTask = json['parent_task'];
    completedBy = json['completed_by'];
    isCustomerPayment = json['is_customer_payment'];
    doctypesName = json['doctypes_name'];
    dId = json['d_id'];
    message = json['message'];
    modeOfPayment = json['mode_of_payment'];
    cashReceived = json['cash_received'];
    location = json['location'];
    completedOn = json['completed_on'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    state = json['state'];
    area = json['area'];
    expStartDate = json['exp_start_date'];
    expectedTime = json['expected_time'];
    start = json['start'];
    expEndDate = json['exp_end_date'];
    progress = json['progress'];
    duration = json['duration'];
    isMilestone = json['is_milestone'];
    description = json['description'];
    dependsOnTasks = json['depends_on_tasks'];
    actStartDate = json['act_start_date'];
    actualTime = json['actual_time'];
    actEndDate = json['act_end_date'];
    totalCostingAmount = json['total_costing_amount'];
    totalExpenseClaim = json['total_expense_claim'];
    totalBillingAmount = json['total_billing_amount'];
    reviewDate = json['review_date'];
    closingDate = json['closing_date'];
    orderNumber = json['order_number'];
    numberOfAttachmentsAllowed = json['number_of_attachments_allowed'];
    department = json['department'];
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
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['idx'] = idx;
    data['docstatus'] = docstatus;
    data['github_sync_id'] = githubSyncId;
    data['subject'] = subject;
    data['show_to_customer'] = showToCustomer;
    data['project'] = project;
    data['project_id'] = projectId;
    data['customer'] = customer;
    data['contact_number'] = contactNumber;
    data['consumer_number'] = consumerNumber;
    data['file_number'] = fileNumber;
    data['whatsapp_number'] = whatsappNumber;
    data['assigned_user'] = assignedUser;
    data['issue'] = issue;
    data['type'] = type;
    data['color'] = color;
    data['lead_id'] = leadId;
    data['opportunity'] = opportunity;
    data['quotation'] = quotation;
    data['sales_order'] = salesOrder;
    data['sales_invoice'] = salesInvoice;
    data['material_request'] = materialRequest;
    data['purchase_order'] = purchaseOrder;
    data['purchase_invoice'] = purchaseInvoice;
    data['p_i'] = pI;
    data['purchase_receipt'] = purchaseReceipt;
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
    data['parent_task'] = parentTask;
    data['completed_by'] = completedBy;
    data['is_customer_payment'] = isCustomerPayment;
    data['doctypes_name'] = doctypesName;
    data['d_id'] = dId;
    data['message'] = message;
    data['mode_of_payment'] = modeOfPayment;
    data['cash_received'] = cashReceived;
    data['location'] = location;
    data['completed_on'] = completedOn;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['city'] = city;
    data['state'] = state;
    data['area'] = area;
    data['exp_start_date'] = expStartDate;
    data['expected_time'] = expectedTime;
    data['start'] = start;
    data['exp_end_date'] = expEndDate;
    data['progress'] = progress;
    data['duration'] = duration;
    data['is_milestone'] = isMilestone;
    data['description'] = description;
    data['depends_on_tasks'] = dependsOnTasks;
    data['act_start_date'] = actStartDate;
    data['actual_time'] = actualTime;
    data['act_end_date'] = actEndDate;
    data['total_costing_amount'] = totalCostingAmount;
    data['total_expense_claim'] = totalExpenseClaim;
    data['total_billing_amount'] = totalBillingAmount;
    data['review_date'] = reviewDate;
    data['closing_date'] = closingDate;
    data['order_number'] = orderNumber;
    data['number_of_attachments_allowed'] = numberOfAttachmentsAllowed;
    data['department'] = department;
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
