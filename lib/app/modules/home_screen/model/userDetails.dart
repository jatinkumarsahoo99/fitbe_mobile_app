class UserDetails {
  Data? data;
  String? message;

  UserDetails({this.data, this.message});

  UserDetails.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedAt'] = this.createdAt;
    data['DateOfBirth'] = this.dateOfBirth;
    data['EmailAddress'] = this.emailAddress;
    data['EmailAddressOTP'] = this.emailAddressOTP;
    data['FullName'] = this.fullName;
    data['MobileNumber'] = this.mobileNumber;
    data['MobileNumberOTP'] = this.mobileNumberOTP;
    data['Password'] = this.password;
    data['Status'] = this.status;
    data['UpdatedAt'] = this.updatedAt;
    data['UserID'] = this.userID;
    data['_id'] = this.sId;
    return data;
  }
}
