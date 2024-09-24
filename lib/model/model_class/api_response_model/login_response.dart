class LoginResponse {
  String? message;
  String? homePage;
  String? fullName;

  LoginResponse({
    this.message,
    this.homePage,
    this.fullName,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        homePage: json["home_page"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "home_page": homePage,
        "full_name": fullName,
      };
}
