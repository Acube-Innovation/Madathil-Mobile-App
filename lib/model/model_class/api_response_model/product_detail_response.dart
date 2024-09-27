class ProductDetailResponse {
  Product? message;

  ProductDetailResponse({
    this.message,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        message: Product.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
      };
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
