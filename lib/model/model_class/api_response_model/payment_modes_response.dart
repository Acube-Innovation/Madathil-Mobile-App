class PaymentModesModel {
  List<PaymentMode>? data;

  PaymentModesModel({this.data});

  PaymentModesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PaymentMode>[];
      json['data'].forEach((v) {
        data!.add(new PaymentMode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentMode {
  String? name;

  PaymentMode({this.name});

  PaymentMode.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
