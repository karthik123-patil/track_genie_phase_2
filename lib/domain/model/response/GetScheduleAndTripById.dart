class GetScheduleAndTripById {
  bool? responseStatus;
  String? responseMessage;
  Data? data;

  GetScheduleAndTripById(
      {this.responseStatus, this.responseMessage, this.data});

  GetScheduleAndTripById.fromJson(Map<String, dynamic> json) {
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
  int? tripID;
  int? vehicleScheduleID;

  Data({this.tripID, this.vehicleScheduleID});

  Data.fromJson(Map<String, dynamic> json) {
    tripID = json['TripID'];
    vehicleScheduleID = json['VehicleScheduleID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TripID'] = this.tripID;
    data['VehicleScheduleID'] = this.vehicleScheduleID;
    return data;
  }
}
