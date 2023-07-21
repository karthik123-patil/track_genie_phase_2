class ATMTxnDetailsResponse {
  List<Data>? data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  ATMTxnDetailsResponse(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  ATMTxnDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    detailedMessage = json['DetailedMessage'];
    errorCode = json['ErrorCode'];
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['DetailedMessage'] = this.detailedMessage;
    data['ErrorCode'] = this.errorCode;
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}

class Data {
  String? deviceID;
  num? finSuc;
  num? finUnSuc;
  num? nonFinSuc;
  num? nonFinUnSuc;
  num? totalSuc;
  num? totalUnSuc;
  String? transDate;

  Data(
      {this.deviceID,
      this.finSuc,
      this.finUnSuc,
      this.nonFinSuc,
      this.nonFinUnSuc,
      this.totalSuc,
      this.totalUnSuc,
      this.transDate});

  Data.fromJson(Map<String, dynamic> json) {
    deviceID = json['DeviceID'];
    finSuc = json['FinSuc'];
    finUnSuc = json['FinUnSuc'];
    nonFinSuc = json['NonFinSuc'];
    nonFinUnSuc = json['NonFinUnSuc'];
    totalSuc = json['TotalSuc'];
    totalUnSuc = json['TotalUnSuc'];
    transDate = json['TransDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceID'] = this.deviceID;
    data['FinSuc'] = this.finSuc;
    data['FinUnSuc'] = this.finUnSuc;
    data['NonFinSuc'] = this.nonFinSuc;
    data['NonFinUnSuc'] = this.nonFinUnSuc;
    data['TotalSuc'] = this.totalSuc;
    data['TotalUnSuc'] = this.totalUnSuc;
    data['TransDate'] = this.transDate;
    return data;
  }
}
