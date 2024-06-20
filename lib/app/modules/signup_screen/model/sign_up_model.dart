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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Gender'] = gender;
    data['MobileNumber'] = mobileNumber;
    data['DateOfBirth'] = dateOfBirth;
    data['EmailVerified'] = emailVerified;
    data['MobileNumberVerified'] = mobileNumberVerified;
    data['OTP'] = oTP;
    data['CreatedAt'] = createdAt;
    return data;
  }
}
