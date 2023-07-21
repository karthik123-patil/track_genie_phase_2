class ChangePasswordResponse {
  ChangeAppUserPasswordResult? changeAppUserPasswordResult;

  ChangePasswordResponse({this.changeAppUserPasswordResult});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    changeAppUserPasswordResult = json['ChangeAppUserPasswordResult'] != null
        ? new ChangeAppUserPasswordResult.fromJson(
            json['ChangeAppUserPasswordResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.changeAppUserPasswordResult != null) {
      data['ChangeAppUserPasswordResult'] =
          this.changeAppUserPasswordResult!.toJson();
    }
    return data;
  }
}

class ChangeAppUserPasswordResult {
  Null? data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  ChangeAppUserPasswordResult(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  ChangeAppUserPasswordResult.fromJson(Map<String, dynamic> json) {
    data = json['Data'];
    detailedMessage = json['DetailedMessage'];
    errorCode = json['ErrorCode'];
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data'] = this.data;
    data['DetailedMessage'] = this.detailedMessage;
    data['ErrorCode'] = this.errorCode;
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}
