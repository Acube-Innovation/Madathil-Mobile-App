class ListUsersResponse {
  List<ListUsersData>? data;

  ListUsersResponse({this.data});

  ListUsersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ListUsersData>[];
      json['data'].forEach((v) {
        data!.add(ListUsersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListUsersData {
  String? name;
  String? fullName;

  ListUsersData({this.name, this.fullName});

  ListUsersData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['full_name'] = fullName;
    return data;
  }
}
