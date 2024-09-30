class CreateCheckOutResponse {
  SaleOrder? data;

  CreateCheckOutResponse({
    this.data,
  });

  factory CreateCheckOutResponse.fromJson(Map<String, dynamic> json) =>
      CreateCheckOutResponse(
        data: SaleOrder.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class SaleOrder {
  String? name;
  String? customerName;
  double? totalQty;

  double? total;
  double? totalTaxesAndCharges;
  double? grandTotal;
  double? roundingAdjustment;
  double? roundedTotal;
  String? doctype;
  List<Item>? items;

  SaleOrder({
    this.name,
    this.customerName,
    this.totalQty,
    this.total,
    this.totalTaxesAndCharges,
    this.grandTotal,
    this.roundingAdjustment,
    this.roundedTotal,
    this.doctype,
    this.items,
  });

  factory SaleOrder.fromJson(Map<String, dynamic> json) => SaleOrder(
        name: json["name"],
        customerName: json["customer_name"],
        totalQty: json["total_qty"],
        total: json["total"],
        totalTaxesAndCharges: json["total_taxes_and_charges"],
        grandTotal: json["grand_total"],
        roundingAdjustment: json["rounding_adjustment"],
        roundedTotal: json["rounded_total"],
        doctype: json["doctype"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "customer_name": customerName,
        "total_qty": totalQty,
        "total": total,
        "total_taxes_and_charges": totalTaxesAndCharges,
        "grand_total": grandTotal,
        "rounding_adjustment": roundingAdjustment,
        "rounded_total": roundedTotal,
        "doctype": doctype,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  String? name;
  String? itemName;
  String? brand;
  String? image;
  double? qty;
  double? rate;

  Item({
    this.name,
    this.itemName,
    this.brand,
    this.image,
    this.qty,
    this.rate,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        itemName: json["item_name"],
        brand: json["brand"],
        image: json["image"],
        qty: json["qty"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "item_name": itemName,
        "brand": brand,
        "image": image,
        "qty": qty,
        "rate": rate,
      };
}
