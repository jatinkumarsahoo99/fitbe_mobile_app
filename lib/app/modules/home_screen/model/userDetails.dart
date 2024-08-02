class UserDetails {
  Data? data;
  String? message;

  UserDetails({this.data, this.message});

  UserDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? createdAt;
  String? dateOfBirth;
  String? emailAddress;
  String? emailAddressOTP;
  String? fullName;
  String? mobileNumber;
  String? mobileNumberOTP;
  String? password;
  String? status;
  String? updatedAt;
  String? userID;
  String? sId;
  String? stravaProfileUrl;
  String? profileUrl;

  Data(
      {this.createdAt,
        this.dateOfBirth,
        this.emailAddress,
        this.emailAddressOTP,
        this.fullName,
        this.mobileNumber,
        this.mobileNumberOTP,
        this.password,
        this.status,
        this.updatedAt,
        this.userID,
        this.stravaProfileUrl,
        this.profileUrl,
        this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['CreatedAt'];
    dateOfBirth = json['DateOfBirth'];
    emailAddress = json['EmailAddress'];
    emailAddressOTP = json['EmailAddressOTP'];
    fullName = json['FullName'];
    mobileNumber = json['MobileNumber'];
    mobileNumberOTP = json['MobileNumberOTP'];
    password = json['Password'];
    status = json['Status'];
    updatedAt = json['UpdatedAt'];
    userID = json['UserID'];
    sId = json['_id'];
    stravaProfileUrl = json['StravaProfileUrl'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CreatedAt'] = createdAt;
    data['DateOfBirth'] = dateOfBirth;
    data['EmailAddress'] = emailAddress;
    data['EmailAddressOTP'] = emailAddressOTP;
    data['FullName'] = fullName;
    data['MobileNumber'] = mobileNumber;
    data['MobileNumberOTP'] = mobileNumberOTP;
    data['Password'] = password;
    data['Status'] = status;
    data['UpdatedAt'] = updatedAt;
    data['UserID'] = userID;
    data['_id'] = sId;
    data['profileUrl'] = profileUrl;
    data['StravaProfileUrl'] = stravaProfileUrl;
    return data;
  }
}
