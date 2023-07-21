class ATMStatusResponse {
  Data? data;
  String? detailedMessage;
  String? errorCode;
  String? message;
  String? status;

  ATMStatusResponse(
      {this.data,
      this.detailedMessage,
      this.errorCode,
      this.message,
      this.status});

  ATMStatusResponse.fromJson(Map<String, dynamic> json) {
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
  List<CassetteStatus>? cassetteStatus;
  DeviceStatus? deviceStatus;
  List<SwitchStatus>? switchStatus;

  Data({this.cassetteStatus, this.deviceStatus, this.switchStatus});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['CassetteStatus'] != null) {
      cassetteStatus = <CassetteStatus>[];
      json['CassetteStatus'].forEach((v) {
        cassetteStatus!.add(new CassetteStatus.fromJson(v));
      });
    }
    deviceStatus = json['DeviceStatus'] != null
        ? new DeviceStatus.fromJson(json['DeviceStatus'])
        : null;
    if (json['SwitchStatus'] != null) {
      switchStatus = <SwitchStatus>[];
      json['SwitchStatus'].forEach((v) {
        switchStatus!.add(new SwitchStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cassetteStatus != null) {
      data['CassetteStatus'] =
          this.cassetteStatus!.map((v) => v.toJson()).toList();
    }
    if (this.deviceStatus != null) {
      data['DeviceStatus'] = this.deviceStatus!.toJson();
    }
    if (this.switchStatus != null) {
      data['SwitchStatus'] = this.switchStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CassetteStatus {
  String? colour;
  int? id;
  String? value;
  bool? bVisible;
  String? description;
  String? name;
  String? pos;
  String? count;

  CassetteStatus({
    this.colour,
    this.id,
    this.value,
    this.bVisible,
    this.description,
    this.name,
    this.pos,
    this.count,
  });

  CassetteStatus.fromJson(Map<String, dynamic> json) {
    colour = json['Colour'];
    id = json['Id'];
    value = json['Value'];
    bVisible = json['bVisible'];
    description = json['description'];
    name = json['name'];
    pos = json['pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Colour'] = this.colour;
    data['Id'] = this.id;
    data['Value'] = this.value;
    data['bVisible'] = this.bVisible;
    data['description'] = this.description;
    data['name'] = this.name;
    data['pos'] = this.pos;
    return data;
  }
}

class SwitchStatus {
  String? colour;
  int? id;
  String? value;
  bool? bVisible;
  String? description;
  String? name;
  String? pos;

  SwitchStatus(
      {this.colour,
      this.id,
      this.value,
      this.bVisible,
      this.description,
      this.name,
      this.pos});

  SwitchStatus.fromJson(Map<String, dynamic> json) {
    colour = json['Colour'];
    id = json['Id'];
    value = json['Value'];
    bVisible = json['bVisible'];
    description = json['description'];
    name = json['name'];
    pos = json['pos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Colour'] = this.colour;
    data['Id'] = this.id;
    data['Value'] = this.value;
    data['bVisible'] = this.bVisible;
    data['description'] = this.description;
    data['name'] = this.name;
    data['pos'] = this.pos;
    return data;
  }
}

class DeviceStatus {
  String? aTMStatus;
  String? app;
  String? colour;
  String? deviceID;
  String? fitProfile;
  String? iPAddress;
  String? internalPort;
  String? languageGroup;
  String? lastSuccCashTxnTime;
  String? lastSuccNonCashTxnTime;
  String? lastHousekeepingTime;
  String? loadSetGroup;
  String? location;
  String? optTimersProfile;
  String? printerType;
  String? region;
  String? shortName;
  String? state;
  Null? tMSStatus;
  int? termType;
  String? terminalType;

  DeviceStatus(
      {this.aTMStatus,
      this.app,
      this.colour,
      this.deviceID,
      this.fitProfile,
      this.iPAddress,
      this.internalPort,
      this.languageGroup,
      this.lastSuccCashTxnTime,
      this.lastSuccNonCashTxnTime,
      this.lastHousekeepingTime,
      this.loadSetGroup,
      this.location,
      this.optTimersProfile,
      this.printerType,
      this.region,
      this.shortName,
      this.state,
      this.tMSStatus,
      this.termType,
      this.terminalType});

  DeviceStatus.fromJson(Map<String, dynamic> json) {
    aTMStatus = json['ATM_Status'];
    app = json['App'];
    colour = json['Colour'];
    deviceID = json['DeviceID'];
    fitProfile = json['Fit_Profile'];
    iPAddress = json['IPAddress'];
    internalPort = json['Internal_Port'];
    languageGroup = json['Language_Group'];
    lastSuccCashTxnTime = json['LastSuccCashTxnTime'];
    lastSuccNonCashTxnTime = json['LastSuccNonCashTxnTime'];
    lastHousekeepingTime = json['Last_Housekeeping_Time'];
    loadSetGroup = json['LoadSet_Group'];
    location = json['Location'];
    optTimersProfile = json['Opt_Timers_Profile'];
    printerType = json['Printer_Type'];
    region = json['Region'];
    shortName = json['Short_Name'];
    state = json['State'];
    tMSStatus = json['TMSStatus'];
    termType = json['Term_Type'];
    terminalType = json['TerminalType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ATM_Status'] = this.aTMStatus;
    data['App'] = this.app;
    data['Colour'] = this.colour;
    data['DeviceID'] = this.deviceID;
    data['Fit_Profile'] = this.fitProfile;
    data['IPAddress'] = this.iPAddress;
    data['Internal_Port'] = this.internalPort;
    data['Language_Group'] = this.languageGroup;
    data['LastSuccCashTxnTime'] = this.lastSuccCashTxnTime;
    data['LastSuccNonCashTxnTime'] = this.lastSuccNonCashTxnTime;
    data['Last_Housekeeping_Time'] = this.lastHousekeepingTime;
    data['LoadSet_Group'] = this.loadSetGroup;
    data['Location'] = this.location;
    data['Opt_Timers_Profile'] = this.optTimersProfile;
    data['Printer_Type'] = this.printerType;
    data['Region'] = this.region;
    data['Short_Name'] = this.shortName;
    data['State'] = this.state;
    data['TMSStatus'] = this.tMSStatus;
    data['Term_Type'] = this.termType;
    data['TerminalType'] = this.terminalType;
    return data;
  }
}
