class GetBrandResponse {
  List<Brand>? data;

  GetBrandResponse({
    this.data,
  });

  factory GetBrandResponse.fromJson(Map<String, dynamic> json) =>
      GetBrandResponse(
        data: List<Brand>.from(json["data"].map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Brand {
  String? name;
  String? brand;

  Brand({
    this.name,
    this.brand,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
      };
}
