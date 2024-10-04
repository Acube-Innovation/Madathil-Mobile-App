class SalesOrderDetailResponse {
  OrderDetail? message;

  SalesOrderDetailResponse({
    this.message,
  });

  factory SalesOrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      SalesOrderDetailResponse(
        message: OrderDetail.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message!.toJson(),
      };
}

class OrderDetail {
  String? name;
  String? customer;
  String? customerName;
  String? contactMobile;
  CustomerAddress? customerAddress;
  String? status;
  String? transactionDate;
  String? deliveryDate;
  double? total;
  double? totalTaxesAndCharges;
  double? roundedTotal;
  List<Item>? items;
  Invoice? invoice;

  OrderDetail({
    this.name,
    this.customer,
    this.customerName,
    this.contactMobile,
    this.customerAddress,
    this.status,
    this.transactionDate,
    this.deliveryDate,
    this.total,
    this.totalTaxesAndCharges,
    this.roundedTotal,
    this.items,
    this.invoice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        name: json["name"],
        customer: json["customer"],
        customerName: json["customer_name"],
        contactMobile: json["contact_mobile"],
        customerAddress: json["customer_address"] != null
            ? CustomerAddress.fromJson(json["customer_address"])
            : null,
        status: json["status"],
        transactionDate: json["transaction_date"],
        deliveryDate: json["delivery_date"],
        total: json["total"],
        totalTaxesAndCharges: json["total_taxes_and_charges"],
        roundedTotal: json["rounded_total"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        invoice: json["invoice"] != null
            ? Invoice.fromJson(json["invoice"])
            : null, // Handling null case for invoice
        //  Invoice.fromJson(json["invoice"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "customer": customer,
        "customer_name": customerName,
        "contact_mobile": contactMobile,
        "customer_address": customerAddress?.toJson(),
        "status": status,
        "transaction_date": transactionDate,
        "delivery_date": deliveryDate,
        "total_taxes_and_charges": totalTaxesAndCharges,
        "rounded_total": roundedTotal,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "invoice": invoice?.toJson(),
      };
}

class CustomerAddress {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;

  CustomerAddress({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
      };
}

class Invoice {
  String? name;
  String? invoiceStatus;
  String? invoiceDate;
  String? invoiceDueDate;
  double? paidAmount;
  double? outstandingAmount;

  Invoice({
    this.name,
    this.invoiceStatus,
    this.invoiceDate,
    this.invoiceDueDate,
    this.paidAmount,
    this.outstandingAmount,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        name: json["name"],
        invoiceStatus: json["invoice_status"],
        invoiceDate: json["invoice_date"],
        invoiceDueDate: json["invoice_date"],
        paidAmount: json["paid_amount"],
        outstandingAmount: json["outstanding_amount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "invoice_status": invoiceStatus,
        "invoice_date": invoiceDate,
        "invoice_due_date": invoiceDueDate,
        "paid_amount": paidAmount,
        "outstanding_amount": outstandingAmount,
      };
}

class Item {
  String? name;
  String? itemCode;
  String? itemName;
  String? brand;
  String? image;
  double? qty;
  String? uom;
  double? rate;
  double? amount;

  Item({
    this.name,
    this.itemCode,
    this.itemName,
    this.brand,
    this.image,
    this.qty,
    this.uom,
    this.rate,
    this.amount,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        itemCode: json["item_code"],
        itemName: json["item_name"],
        brand: json["brand"],
        image: json["image"],
        qty: json["qty"],
        uom: json["uom"],
        rate: json["rate"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "item_code": itemCode,
        "item_name": itemName,
        "brand": brand,
        "image": image,
        "qty": qty,
        "uom": uom,
        "rate": rate,
        "amount": amount,
      };
}
