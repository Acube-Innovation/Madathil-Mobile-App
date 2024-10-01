class ProductListResponse {
  List<ProductList>? message;

  ProductListResponse({
    this.message,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      ProductListResponse(
        message: List<ProductList>.from(
            json["message"].map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class ProductList {
  String? name;
  String? itemCode;
  String? itemName;
  String? business;
  String? image;
  String? brand;
  String? description;
  DateTime? creation;
  double? rate;
  double? dealerRate;

  ProductList({
    this.name,
    this.itemCode,
    this.itemName,
    this.business,
    this.image,
    this.brand,
    this.description,
    this.creation,
    this.rate,
    this.dealerRate,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        name: json["name"],
        itemCode: json["item_code"],
        itemName: json["item_name"],
        business: json["business"],
        image: json["image"],
        brand: json["brand"],
        description: json["description"],
        creation: DateTime.parse(json["creation"]),
        rate: json["rate"],
        dealerRate: json["dealer_rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "item_code": itemCode,
        "item_name": itemName,
        "business": business,
        "image": image,
        "brand": brand,
        "description": description,
        "creation": creation?.toIso8601String(),
        "rate": rate,
        "dealer_rate": dealerRate,
      };
}
