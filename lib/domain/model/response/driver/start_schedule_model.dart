class StartVehicleSchedule {
  StartVehicleSchedule({
    this.responseStatus,
    this.responseMessage,
    this.data,
    this.typeOfJourney,});

  StartVehicleSchedule.fromJson(dynamic json) {
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    data = json['data'];
    typeOfJourney = json['typeOfJourney'];
  }
  bool? responseStatus;
  String? responseMessage;
  int? data;
  String? typeOfJourney;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseStatus'] = responseStatus;
    map['responseMessage'] = responseMessage;
    map['data'] = data;
    map['typeOfJourney'] = typeOfJourney;
    return map;
  }

}