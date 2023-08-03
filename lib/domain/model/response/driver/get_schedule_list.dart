class ScheduledVehicleList {
  bool? responseStatus;
  String? responseMessage;
  List<Data>? data;

  ScheduledVehicleList({this.responseStatus, this.responseMessage, this.data});

  ScheduledVehicleList.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? vehicleScheduleID;
  String? routeVehicleScheduleName;

  Data({this.vehicleScheduleID, this.routeVehicleScheduleName});

  Data.fromJson(Map<String, dynamic> json) {
    vehicleScheduleID = json['vehicleScheduleID'];
    routeVehicleScheduleName = json['routeVehicleScheduleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleScheduleID'] = this.vehicleScheduleID;
    data['routeVehicleScheduleName'] = this.routeVehicleScheduleName;
    return data;
  }
}