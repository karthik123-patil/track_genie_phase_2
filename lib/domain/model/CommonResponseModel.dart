class CommonResponseModel {
  dynamic data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  CommonResponseModel(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
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
