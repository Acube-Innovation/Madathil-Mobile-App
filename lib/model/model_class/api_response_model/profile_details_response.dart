class ProfileDetailsResponse {
  Message? message;

  ProfileDetailsResponse({this.message});

  ProfileDetailsResponse.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  bool? success;
  Profile? profile;

  Message({this.success, this.profile});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? id;
  String? fullName;
  String? mobileNo;
  String? pan;
  String? address;
  String? image;
  String? aadharNumber;
  String? dateOfBirth;

  Profile(
      {this.id,
      this.fullName,
      this.mobileNo,
      this.pan,
      this.address,
      this.image,
      this.aadharNumber,
      this.dateOfBirth});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    mobileNo = json['mobile_no'];
    pan = json['pan'];
    address = json['address'];
    aadharNumber = json["aadhar_number"];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['full_name'] = fullName;
    data['mobile_no'] = mobileNo;
    data['pan'] = pan;
    data['address'] = address;
    data['aadhar_number'] = aadharNumber;
    data['image'] = image;
    data['date_of_birth'] = dateOfBirth;
    return data;
  }
}
