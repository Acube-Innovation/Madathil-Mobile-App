class OnGoingTransactionDetailsResponse {
  List<TransactionData>? data;

  OnGoingTransactionDetailsResponse({this.data});

  OnGoingTransactionDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransactionData>[];
      json['data'].forEach((v) {
        data!.add(TransactionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionData {
  String? name;
  String? creation;
  String? modified;
  String? modifiedBy;
  String? owner;
  int? docstatus;
  String? parent;
  String? parentfield;
  String? parenttype;
  int? idx;
  String? paymentLinkId;
  String? status;
  String? shortUrl;
  int? upiLink;
  double? amount;
  double? amountPaid;
  String? currency;
  String? customerName;
  String? customerContact;
  String? customerEmail;
  int? notifySms;
  int? notifyEmail;
  String? salesInvoice;
  String? customer;
  int? acceptPartial;
  double? firstMinPartialAmount;
  int? reminderEnable;
  String? userId;
  String? referenceId;
  String? callbackMethod;
  String? callbackUrl;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? cancelledAt;
  String? expireBy;
  String? expiredAt;
  String? notes;
  String? payments;
  String? reminders;
  String? nUserTags;
  String? nComments;
  String? nAssign;
  String? nLikedBy;

  TransactionData({
    this.name,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.owner,
    this.docstatus,
    this.parent,
    this.parentfield,
    this.parenttype,
    this.idx,
    this.paymentLinkId,
    this.status,
    this.shortUrl,
    this.upiLink,
    this.amount,
    this.amountPaid,
    this.currency,
    this.customerName,
    this.customerContact,
    this.customerEmail,
    this.notifySms,
    this.notifyEmail,
    this.salesInvoice,
    this.customer,
    this.acceptPartial,
    this.firstMinPartialAmount,
    this.reminderEnable,
    this.userId,
    this.referenceId,
    this.callbackMethod,
    this.callbackUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.cancelledAt,
    this.expireBy,
    this.expiredAt,
    this.notes,
    this.payments,
    this.reminders,
    this.nUserTags,
    this.nComments,
    this.nAssign,
    this.nLikedBy,
  });

  TransactionData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    creation = json['creation'];
    modified = json['modified'];
    modifiedBy = json['modified_by'];
    owner = json['owner'];
    docstatus = json['docstatus'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    idx = json['idx'];
    paymentLinkId = json['payment_link_id'];
    status = json['status'];
    shortUrl = json['short_url'];
    upiLink = json['upi_link'];
    amount = (json['amount'] as num?)?.toDouble();
    amountPaid = (json['amount_paid'] as num?)?.toDouble();
    currency = json['currency'];
    customerName = json['customer_name'];
    customerContact = json['customer_contact'];
    customerEmail = json['customer_email'];
    notifySms = json['notify_sms'];
    notifyEmail = json['notify_email'];
    salesInvoice = json['sales_invoice'];
    customer = json['customer'];
    acceptPartial = json['accept_partial'];
    firstMinPartialAmount = (json['first_min_partial_amount'] as num?)?.toDouble();
    reminderEnable = json['reminder_enable'];
    userId = json['user_id'];
    referenceId = json['reference_id'];
    callbackMethod = json['callback_method'];
    callbackUrl = json['callback_url'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cancelledAt = json['cancelled_at'];
    expireBy = json['expire_by'];
    expiredAt = json['expired_at'];
    notes = json['notes'];
    payments = json['payments'];
    reminders = json['reminders'];
    nUserTags = json['_user_tags'];
    nComments = json['_comments'];
    nAssign = json['_assign'];
    nLikedBy = json['_liked_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['creation'] = creation;
    data['modified'] = modified;
    data['modified_by'] = modifiedBy;
    data['owner'] = owner;
    data['docstatus'] = docstatus;
    data['parent'] = parent;
    data['parentfield'] = parentfield;
    data['parenttype'] = parenttype;
    data['idx'] = idx;
    data['payment_link_id'] = paymentLinkId;
    data['status'] = status;
    data['short_url'] = shortUrl;
    data['upi_link'] = upiLink;
    data['amount'] = amount;
    data['amount_paid'] = amountPaid;
    data['currency'] = currency;
    data['customer_name'] = customerName;
    data['customer_contact'] = customerContact;
    data['customer_email'] = customerEmail;
    data['notify_sms'] = notifySms;
    data['notify_email'] = notifyEmail;
    data['sales_invoice'] = salesInvoice;
    data['customer'] = customer;
    data['accept_partial'] = acceptPartial;
    data['first_min_partial_amount'] = firstMinPartialAmount;
    data['reminder_enable'] = reminderEnable;
    data['user_id'] = userId;
    data['reference_id'] = referenceId;
    data['callback_method'] = callbackMethod;
    data['callback_url'] = callbackUrl;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cancelled_at'] = cancelledAt;
    data['expire_by'] = expireBy;
    data['expired_at'] = expiredAt;
    data['notes'] = notes;
    data['payments'] = payments;
    data['reminders'] = reminders;
    data['_user_tags'] = nUserTags;
    data['_comments'] = nComments;
    data['_assign'] = nAssign;
    data['_liked_by'] = nLikedBy;
    return data;
  }
}
