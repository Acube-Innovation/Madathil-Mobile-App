class GetOrderStatusResponse {
  List<String>? message;

  GetOrderStatusResponse({
    this.message,
  });

  factory GetOrderStatusResponse.fromJson(Map<String, dynamic> json) =>
      GetOrderStatusResponse(
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message!.map((x) => x)),
      };
}
