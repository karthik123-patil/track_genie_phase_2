class BusInfoModel {
  bool? responseStatus;
  String? responseMessage;
  Data? data;

  BusInfoModel({this.responseStatus, this.responseMessage, this.data});

  BusInfoModel.fromJson(Map<String, dynamic> json) {
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
  int? routeID;
  String? routeName;
  String? vehicleRegisterationNumber;
  String? vehicleType;
  List<Drivers>? drivers;
  List<Attendants>? attendants;

  Data(
      {this.routeID,
        this.routeName,
        this.vehicleRegisterationNumber,
        this.vehicleType,
        this.drivers,
        this.attendants});

  Data.fromJson(Map<String, dynamic> json) {
    routeID = json['routeID'];
    routeName = json['routeName'];
    vehicleRegisterationNumber = json['vehicleRegisterationNumber'];
    vehicleType = json['vehicleType'];
    if (json['drivers'] != null) {
      drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        drivers!.add(new Drivers.fromJson(v));
      });
    }
    if (json['attendants'] != null) {
      attendants = <Attendants>[];
      json['attendants'].forEach((v) {
        attendants!.add(new Attendants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routeID'] = this.routeID;
    data['routeName'] = this.routeName;
    data['vehicleRegisterationNumber'] = this.vehicleRegisterationNumber;
    data['vehicleType'] = this.vehicleType;
    if (this.drivers != null) {
      data['drivers'] = this.drivers!.map((v) => v.toJson()).toList();
    }
    if (this.attendants != null) {
      data['attendants'] = this.attendants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drivers {
  String? userName;
  int? userPhoneNumber;

  Drivers({this.userName, this.userPhoneNumber});

  Drivers.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userPhoneNumber = json['userPhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userPhoneNumber'] = this.userPhoneNumber;
    return data;
  }
}

class Attendants {
  String? userName;
  int? userPhoneNumber;

  Attendants({this.userName, this.userPhoneNumber});

  Attendants.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userPhoneNumber = json['userPhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userPhoneNumber'] = this.userPhoneNumber;
    return data;
  }
}
