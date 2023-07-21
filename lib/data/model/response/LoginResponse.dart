/*

{
    "AuthenticateAppUserResult": {
        "Data": {
            "MasterFranchiseeConfirmation": null,
            "Message": "Active",
            "User": {
                "AuthToken": "ZljooTXabvqG4b+w+0SA9A==",
                "Email": "SONI.BIND@CONTRACTOR.TATACOMMUNICATIONS.COM",
                "IsEmailVerified": 1,
                "IsThirdPartyLetterVerified": 1,
                "Login": "soni.bind",
                "MappingFor": "Franchisee",
                "MobileNo": "0",
                "PwdChangedOn": "08/05/2023 17:16:21",
                "RelationshipManager": null,
                "RelationshipManagerMobileNo": null,
                "ReportingTo": "Rizwan Naik",
                "UserName": "Soni Bind",
                "bActive": true,
                "bBlocked": false,
                "iUser": 12295
            }
        },
        "DetailedMessage": "",
        "ErrorCode": "",
        "Message": "User details loaded successfully",
        "Status": "1"
    }
}

 */

class LoginResponse {
  AuthenticateAppUserResult? authenticateAppUserResult;

  LoginResponse({this.authenticateAppUserResult});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    authenticateAppUserResult = json['AuthenticateAppUserResult'] != null
        ? new AuthenticateAppUserResult.fromJson(
            json['AuthenticateAppUserResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authenticateAppUserResult != null) {
      data['AuthenticateAppUserResult'] =
          this.authenticateAppUserResult!.toJson();
    }
    return data;
  }
}

class AuthenticateAppUserResult {
  Data? data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  AuthenticateAppUserResult(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  AuthenticateAppUserResult.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    detailedMessage = json['DetailedMessage'];
    errorCode = json['ErrorCode'];
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['DetailedMessage'] = this.detailedMessage;
    data['ErrorCode'] = this.errorCode;
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}

class Data {
  Null? masterFranchiseeConfirmation;
  String? message;
  User? user;

  Data({this.masterFranchiseeConfirmation, this.message, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    masterFranchiseeConfirmation = json['MasterFranchiseeConfirmation'];
    message = json['Message'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MasterFranchiseeConfirmation'] = this.masterFranchiseeConfirmation;
    data['Message'] = this.message;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? authToken;
  String? email;
  int? isEmailVerified;
  int? isThirdPartyLetterVerified;
  String? login;
  String? mappingFor;
  String? mobileNo;
  String? pwdChangedOn;
  String? relationshipManager;
  String? relationshipManagerMobileNo;
  String? reportingTo;
  String? userName;
  bool? bActive;
  bool? bBlocked;
  int? iUser;

  User(
      {this.authToken,
      this.email,
      this.isEmailVerified,
      this.isThirdPartyLetterVerified,
      this.login,
      this.mappingFor,
      this.mobileNo,
      this.pwdChangedOn,
      this.relationshipManager,
      this.relationshipManagerMobileNo,
      this.reportingTo,
      this.userName,
      this.bActive,
      this.bBlocked,
      this.iUser});

  User.fromJson(Map<String, dynamic> json) {
    authToken = json['AuthToken'];
    email = json['Email'];
    isEmailVerified = json['IsEmailVerified'];
    isThirdPartyLetterVerified = json['IsThirdPartyLetterVerified'];
    login = json['Login'];
    mappingFor = json['MappingFor'];
    mobileNo = json['MobileNo'];
    pwdChangedOn = json['PwdChangedOn'];
    relationshipManager = json['RelationshipManager'];
    relationshipManagerMobileNo = json['RelationshipManagerMobileNo'];
    reportingTo = json['ReportingTo'];
    userName = json['UserName'];
    bActive = json['bActive'];
    bBlocked = json['bBlocked'];
    iUser = json['iUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuthToken'] = this.authToken;
    data['Email'] = this.email;
    data['IsEmailVerified'] = this.isEmailVerified;
    data['IsThirdPartyLetterVerified'] = this.isThirdPartyLetterVerified;
    data['Login'] = this.login;
    data['MappingFor'] = this.mappingFor;
    data['MobileNo'] = this.mobileNo;
    data['PwdChangedOn'] = this.pwdChangedOn;
    data['RelationshipManager'] = this.relationshipManager;
    data['RelationshipManagerMobileNo'] = this.relationshipManagerMobileNo;
    data['ReportingTo'] = this.reportingTo;
    data['UserName'] = this.userName;
    data['bActive'] = this.bActive;
    data['bBlocked'] = this.bBlocked;
    data['iUser'] = this.iUser;
    return data;
  }
}
