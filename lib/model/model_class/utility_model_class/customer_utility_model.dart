class CustomerUtilModel {
  String? name;
  String? email;
  String? phoneNumber;

  String? image;
  CustomerUtilModel({this.name, this.phoneNumber, this.email, this.image});
}

class CstAddressUtilModel {
  String? pinCode;
  String? city;
  String? state;
  String? country;
  String? addressLine1;
  String? addressLine2;

  CstAddressUtilModel({
    this.pinCode,
    this.city,
    this.state,
    this.country,
    this.addressLine1,
    this.addressLine2,
  });
}
