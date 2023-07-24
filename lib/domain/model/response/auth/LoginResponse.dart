class LoginResponse {
  bool? responseStatus;
  String? responseMessage;
  Data? data;

  LoginResponse({this.responseStatus, this.responseMessage, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userID;
  String? userFirstName;
  String? userMiddleName;
  String? userLastName;
  int? userPhoneNumber;
  int? userAlternatePhoneNumber;
  String? userAddress;
  String? userPhoto;
  String? userUniqueKey;
  String? userQRcode;
  String? userQRcodeString;
  int? userAge;
  String? userSex;
  String? userClass;
  String? priGuardian;
  String? secGuardian;
  String? drivingLicense;
  String? govId;
  int? otp;
  String? email;
  String? tempURL;
  List<Roles>? roles;

  Data(
      {this.userID,
        this.userFirstName,
        this.userMiddleName,
        this.userLastName,
        this.userPhoneNumber,
        this.userAlternatePhoneNumber,
        this.userAddress,
        this.userPhoto,
        this.userUniqueKey,
        this.userQRcode,
        this.userQRcodeString,
        this.userAge,
        this.userSex,
        this.userClass,
        this.priGuardian,
        this.secGuardian,
        this.drivingLicense,
        this.govId,
        this.otp,
        this.email,
        this.tempURL,
        this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userFirstName = json['userFirstName'];
    userMiddleName = json['userMiddleName'];
    userLastName = json['userLastName'];
    userPhoneNumber = json['userPhoneNumber'];
    userAlternatePhoneNumber = json['userAlternatePhoneNumber'];
    userAddress = json['userAddress'];
    userPhoto = json['userPhoto'];
    userUniqueKey = json['userUniqueKey'];
    userQRcode = json['userQRcode'];
    userQRcodeString = json['userQRcodeString'];
    userAge = json['userAge'];
    userSex = json['userSex'];
    userClass = json['userClass'];
    priGuardian = json['priGuardian'];
    secGuardian = json['secGuardian'];
    drivingLicense = json['drivingLicense'];
    govId = json['govId'];
    otp = json['otp'];
    email = json['email'];
    tempURL = json['tempURL'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userFirstName'] = this.userFirstName;
    data['userMiddleName'] = this.userMiddleName;
    data['userLastName'] = this.userLastName;
    data['userPhoneNumber'] = this.userPhoneNumber;
    data['userAlternatePhoneNumber'] = this.userAlternatePhoneNumber;
    data['userAddress'] = this.userAddress;
    data['userPhoto'] = this.userPhoto;
    data['userUniqueKey'] = this.userUniqueKey;
    data['userQRcode'] = this.userQRcode;
    data['userQRcodeString'] = this.userQRcodeString;
    data['userAge'] = this.userAge;
    data['userSex'] = this.userSex;
    data['userClass'] = this.userClass;
    data['priGuardian'] = this.priGuardian;
    data['secGuardian'] = this.secGuardian;
    data['drivingLicense'] = this.drivingLicense;
    data['govId'] = this.govId;
    data['otp'] = this.otp;
    data['email'] = this.email;
    data['tempURL'] = this.tempURL;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? roleID;
  String? roleName;

  Roles({this.roleID, this.roleName});

  Roles.fromJson(Map<String, dynamic> json) {
    roleID = json['roleID'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleID'] = this.roleID;
    data['roleName'] = this.roleName;
    return data;
  }
}
