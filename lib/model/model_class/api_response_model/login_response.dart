class LoginResponse {
  String? message;
  String? homePage;
  String? fullName;
  String? exception;
  String? exc;

  LoginResponse({
    this.message,
    this.homePage,
    this.fullName,
    this.exception,
    this.exc,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        homePage: json["home_page"],
        fullName: json["full_name"],
        exception: json["exception"],
        exc: json["exc"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "home_page": homePage,
        "full_name": fullName,
        "exception": exception,
        "exc": exc,
      };
}
