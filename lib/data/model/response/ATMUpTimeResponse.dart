class ATMUpTimeDetailsResponse {
  List<Data>? data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  ATMUpTimeDetailsResponse(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  ATMUpTimeDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  num? accessibility;
  num? autoFixed;
  num? bankAssistanceRequired;
  num? cashOut;
  String? deviceID;
  num? downTime;
  num? fLM;
  num? forceMajeure;
  num? network;
  num? power;
  num? sLM;
  num? siteIssue;
  num? supervisor;
  num? uPS;
  num? upTime;
  String? upTimeDate;
  String? upTimeDateString;

  Data(
      {this.accessibility,
      this.autoFixed,
      this.bankAssistanceRequired,
      this.cashOut,
      this.deviceID,
      this.downTime,
      this.fLM,
      this.forceMajeure,
      this.network,
      this.power,
      this.sLM,
      this.siteIssue,
      this.supervisor,
      this.uPS,
      this.upTime,
      this.upTimeDate,
      this.upTimeDateString});

  Data.fromJson(Map<String, dynamic> json) {
    accessibility = json['Accessibility'];
    autoFixed = json['AutoFixed'];
    bankAssistanceRequired = json['BankAssistanceRequired'];
    cashOut = json['CashOut'];
    deviceID = json['DeviceID'];
    downTime = json['DownTime'];
    fLM = json['FLM'];
    forceMajeure = json['ForceMajeure'];
    network = json['Network'];
    power = json['Power'];
    sLM = json['SLM'];
    siteIssue = json['SiteIssue'];
    supervisor = json['Supervisor'];
    uPS = json['UPS'];
    upTime = json['UpTime'];
    upTimeDate = json['UpTimeDate'];
    upTimeDateString = json['UpTimeDate_String'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Accessibility'] = this.accessibility;
    data['AutoFixed'] = this.autoFixed;
    data['BankAssistanceRequired'] = this.bankAssistanceRequired;
    data['CashOut'] = this.cashOut;
    data['DeviceID'] = this.deviceID;
    data['DownTime'] = this.downTime;
    data['FLM'] = this.fLM;
    data['ForceMajeure'] = this.forceMajeure;
    data['Network'] = this.network;
    data['Power'] = this.power;
    data['SLM'] = this.sLM;
    data['SiteIssue'] = this.siteIssue;
    data['Supervisor'] = this.supervisor;
    data['UPS'] = this.uPS;
    data['UpTime'] = this.upTime;
    data['UpTimeDate'] = this.upTimeDate;
    data['UpTimeDate_String'] = this.upTimeDateString;
    return data;
  }
}
