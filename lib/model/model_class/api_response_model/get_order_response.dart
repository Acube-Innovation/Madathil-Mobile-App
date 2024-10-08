class GetOrdersResponse {
  List<OrderList>? data;

  GetOrdersResponse({
    this.data,
  });

  factory GetOrdersResponse.fromJson(Map<String, dynamic> json) =>
      GetOrdersResponse(
        data: List<OrderList>.from(
            json["data"].map((x) => OrderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrderList {
  String? name;
  String? customerName;
  double? grandTotal;
  String? deliveryDate;
  String? transactionDate;
  String? orderType;
  double? totalQty;
  double? totalTaxesAndCharges;
  String? billingStatus;
  String? deliveryStatus;
  String? status;

  OrderList({
    this.name,
    this.customerName,
    this.grandTotal,
    this.deliveryDate,
    this.transactionDate,
    this.orderType,
    this.totalQty,
    this.totalTaxesAndCharges,
    this.billingStatus,
    this.deliveryStatus,
    this.status,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        name: json["name"],
        customerName: json["customer_name"],
        grandTotal: json["grand_total"],
        deliveryDate: json["delivery_date"],
        transactionDate: json["transaction_date"],
        orderType: json["order_type"],
        totalQty: json["total_qty"],
        totalTaxesAndCharges: json["total_taxes_and_charges"],
        billingStatus: json["billing_status"],
        deliveryStatus: json["delivery_status"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "customer_name": customerName,
        "grand_total": grandTotal,
        "delivery_date": deliveryDate,
        "transaction_date": deliveryDate,
        "order_type": orderType,
        "total_qty": totalQty,
        "total_taxes_and_charges": totalTaxesAndCharges,
        "billing_status": billingStatus,
        "delivery_status": deliveryStatus,
        "status": status,
      };
}
