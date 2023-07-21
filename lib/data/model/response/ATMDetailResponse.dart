class ATMDetailResponse {
  List<Data>? data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  ATMDetailResponse(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  ATMDetailResponse.fromJson(Map<String, dynamic> json) {
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
  String? aTMMake;
  String? aTMO;
  String? address;
  String? appLoginStatus;
  String? cashTakeOverDate;
  String? category;
  String? coBranding;
  String? covidCategory;
  String? covidColor;
  int? currentBalance;
  String? deviceID;
  String? deviceStatus;
  int? dispense;
  int? dispenseCurrDay;
  int? finSucCurrDay;
  String? insertDate;
  String? insertDateString;
  bool? isAnswerAvailable;
  String? lastFeedbackDate;
  String? lastTaggedDate;
  String? lastVisitDate;
  String? latLong;
  String? locationHead;
  String? nonFinAverage;
  String? nonFinPercentage;
  int? nonFinSucCurrDay;
  int? openTicketCount;
  String? propId;
  String? qCInputDate;
  String? region;
  String? regionalHead;
  String? siteType;
  String? state;
  String? stateHead;
  int? tagCount;
  String? tier;
  int? totalTxnCurrDay;
  String? transactionAverage;
  String? transactionCount;
  int? txnPotential;
  String? txnTagging;
  int? txnYest;
  int? uID;
  int? upTimeYest;
  String? uptimeTagging;
  String? userName;
  int? iIndicashDostATMUser;
  int? iUser;

  Data(
      {this.aTMMake,
      this.aTMO,
      this.address,
      this.appLoginStatus,
      this.cashTakeOverDate,
      this.category,
      this.coBranding,
      this.covidCategory,
      this.covidColor,
      this.currentBalance,
      this.deviceID,
      this.deviceStatus,
      this.dispense,
      this.dispenseCurrDay,
      this.finSucCurrDay,
      this.insertDate,
      this.insertDateString,
      this.isAnswerAvailable,
      this.lastFeedbackDate,
      this.lastTaggedDate,
      this.lastVisitDate,
      this.latLong,
      this.locationHead,
      this.nonFinAverage,
      this.nonFinPercentage,
      this.nonFinSucCurrDay,
      this.openTicketCount,
      this.propId,
      this.qCInputDate,
      this.region,
      this.regionalHead,
      this.siteType,
      this.state,
      this.stateHead,
      this.tagCount,
      this.tier,
      this.totalTxnCurrDay,
      this.transactionAverage,
      this.transactionCount,
      this.txnPotential,
      this.txnTagging,
      this.txnYest,
      this.uID,
      this.upTimeYest,
      this.uptimeTagging,
      this.userName,
      this.iIndicashDostATMUser,
      this.iUser});

  Data.fromJson(Map<String, dynamic> json) {
    aTMMake = json['ATMMake'];
    aTMO = json['ATMO'];
    address = json['Address'];
    appLoginStatus = json['AppLoginStatus'];
    cashTakeOverDate = json['CashTakeOverDate'];
    category = json['Category'];
    coBranding = json['CoBranding'];
    covidCategory = json['CovidCategory'];
    covidColor = json['CovidColor'];
    currentBalance = json['CurrentBalance'];
    deviceID = json['DeviceID'];
    deviceStatus = json['DeviceStatus'];
    dispense = json['Dispense'];
    dispenseCurrDay = json['DispenseCurrDay'];
    finSucCurrDay = json['FinSucCurrDay'];
    insertDate = json['InsertDate'];
    insertDateString = json['InsertDate_String'];
    isAnswerAvailable = json['IsAnswerAvailable'];
    lastFeedbackDate = json['LastFeedbackDate'];
    lastTaggedDate = json['LastTaggedDate'];
    lastVisitDate = json['LastVisitDate'];
    latLong = json['LatLong'];
    locationHead = json['LocationHead'];
    nonFinAverage = json['NonFinAverage'];
    nonFinPercentage = json['NonFinPercentage'];
    nonFinSucCurrDay = json['NonFinSucCurrDay'];
    openTicketCount = json['OpenTicketCount'];
    propId = json['PropId'];
    qCInputDate = json['QCInputDate'];
    region = json['Region'];
    regionalHead = json['RegionalHead'];
    siteType = json['SiteType'];
    state = json['State'];
    stateHead = json['StateHead'];
    tagCount = json['TagCount'];
    tier = json['Tier'];
    totalTxnCurrDay = json['TotalTxnCurrDay'];
    transactionAverage = json['TransactionAverage'];
    transactionCount = json['TransactionCount'];
    txnPotential = json['TxnPotential'];
    txnTagging = json['TxnTagging'];
    txnYest = json['TxnYest'];
    uID = json['UID'];
    upTimeYest = json['UpTimeYest'];
    uptimeTagging = json['UptimeTagging'];
    userName = json['UserName'];
    iIndicashDostATMUser = json['iIndicashDostATMUser'];
    iUser = json['iUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ATMMake'] = this.aTMMake;
    data['ATMO'] = this.aTMO;
    data['Address'] = this.address;
    data['AppLoginStatus'] = this.appLoginStatus;
    data['CashTakeOverDate'] = this.cashTakeOverDate;
    data['Category'] = this.category;
    data['CoBranding'] = this.coBranding;
    data['CovidCategory'] = this.covidCategory;
    data['CovidColor'] = this.covidColor;
    data['CurrentBalance'] = this.currentBalance;
    data['DeviceID'] = this.deviceID;
    data['DeviceStatus'] = this.deviceStatus;
    data['Dispense'] = this.dispense;
    data['DispenseCurrDay'] = this.dispenseCurrDay;
    data['FinSucCurrDay'] = this.finSucCurrDay;
    data['InsertDate'] = this.insertDate;
    data['InsertDate_String'] = this.insertDateString;
    data['IsAnswerAvailable'] = this.isAnswerAvailable;
    data['LastFeedbackDate'] = this.lastFeedbackDate;
    data['LastTaggedDate'] = this.lastTaggedDate;
    data['LastVisitDate'] = this.lastVisitDate;
    data['LatLong'] = this.latLong;
    data['LocationHead'] = this.locationHead;
    data['NonFinAverage'] = this.nonFinAverage;
    data['NonFinPercentage'] = this.nonFinPercentage;
    data['NonFinSucCurrDay'] = this.nonFinSucCurrDay;
    data['OpenTicketCount'] = this.openTicketCount;
    data['PropId'] = this.propId;
    data['QCInputDate'] = this.qCInputDate;
    data['Region'] = this.region;
    data['RegionalHead'] = this.regionalHead;
    data['SiteType'] = this.siteType;
    data['State'] = this.state;
    data['StateHead'] = this.stateHead;
    data['TagCount'] = this.tagCount;
    data['Tier'] = this.tier;
    data['TotalTxnCurrDay'] = this.totalTxnCurrDay;
    data['TransactionAverage'] = this.transactionAverage;
    data['TransactionCount'] = this.transactionCount;
    data['TxnPotential'] = this.txnPotential;
    data['TxnTagging'] = this.txnTagging;
    data['TxnYest'] = this.txnYest;
    data['UID'] = this.uID;
    data['UpTimeYest'] = this.upTimeYest;
    data['UptimeTagging'] = this.uptimeTagging;
    data['UserName'] = this.userName;
    data['iIndicashDostATMUser'] = this.iIndicashDostATMUser;
    data['iUser'] = this.iUser;
    return data;
  }
}
