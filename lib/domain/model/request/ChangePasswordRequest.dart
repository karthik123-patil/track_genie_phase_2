class ChangePasswordRequest {
  int? iUser;
  String? userName;
  String? newPassword;
  String? uniquecode;
  String? requestFor;

  ChangePasswordRequest(
      {this.iUser,
      this.userName,
      this.newPassword,
      this.uniquecode,
      this.requestFor});

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    iUser = json['iUser'];
    userName = json['userName'];
    newPassword = json['newPassword'];
    uniquecode = json['uniquecode'];
    requestFor = json['requestFor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iUser'] = this.iUser;
    data['userName'] = this.userName;
    data['newPassword'] = this.newPassword;
    data['uniquecode'] = this.uniquecode;
    data['requestFor'] = this.requestFor;
    return data;
  }
}
