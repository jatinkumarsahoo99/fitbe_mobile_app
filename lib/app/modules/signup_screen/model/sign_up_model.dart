class SignUpModel {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? mobileNumber;
  String? dateOfBirth;
  bool? emailVerified;
  bool? mobileNumberVerified;
  int? oTP;
  String? createdAt;

  SignUpModel(
      {this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.mobileNumber,
        this.dateOfBirth,
        this.emailVerified,
        this.mobileNumberVerified,
        this.oTP,
        this.createdAt});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    gender = json['Gender'];
    mobileNumber = json['MobileNumber'];
    dateOfBirth = json['DateOfBirth'];
    emailVerified = json['EmailVerified'];
    mobileNumberVerified = json['MobileNumberVerified'];
    oTP = json['OTP'];
    createdAt = json['CreatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    data['Gender'] = this.gender;
    data['MobileNumber'] = this.mobileNumber;
    data['DateOfBirth'] = this.dateOfBirth;
    data['EmailVerified'] = this.emailVerified;
    data['MobileNumberVerified'] = this.mobileNumberVerified;
    data['OTP'] = this.oTP;
    data['CreatedAt'] = this.createdAt;
    return data;
  }
}
