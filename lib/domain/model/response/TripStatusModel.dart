class TripStatusModel {
  bool? responseStatus;
  String? responseMessage;
  Data? data;

  TripStatusModel({this.responseStatus, this.responseMessage, this.data});

  TripStatusModel.fromJson(Map<String, dynamic> json) {
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
  int? missedBusCount;
  int? totalCountExcludingStudentsOnScheduledLeave;
  String? passengerStatusMessage;
  int? totalStops;
  List<StopsList>? list;
  int? pickedCount;

  Data(
      {this.missedBusCount,
        this.totalCountExcludingStudentsOnScheduledLeave,
        this.passengerStatusMessage,
        this.totalStops,
        this.list,
        this.pickedCount});

  Data.fromJson(Map<String, dynamic> json) {
    missedBusCount = json['missedBusCount'];
    totalCountExcludingStudentsOnScheduledLeave =
    json['totalCountExcludingStudentsOnScheduledLeave'];
    passengerStatusMessage = json['passengerStatusMessage'];
    totalStops = json['totalStops'];
    if (json['list'] != null) {
      list = <StopsList>[];
      json['list'].forEach((v) {
        list!.add(new StopsList.fromJson(v));
      });
    }
    pickedCount = json['pickedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['missedBusCount'] = this.missedBusCount;
    data['totalCountExcludingStudentsOnScheduledLeave'] =
        this.totalCountExcludingStudentsOnScheduledLeave;
    data['passengerStatusMessage'] = this.passengerStatusMessage;
    data['totalStops'] = this.totalStops;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['pickedCount'] = this.pickedCount;
    return data;
  }
}

class StopsList {
  int? stopOrder;
  Stop? stop;
  String? scheduledArrivalTime;
  String? scheduledDepartureTime;
  int? missedBusStudentsCount;
  int? pickedStudentsCount;
  int? totalStudentsCountExcludingStudentsOnScheduledLeave;

  StopsList(
      {this.stopOrder,
        this.stop,
        this.scheduledArrivalTime,
        this.scheduledDepartureTime,
        this.missedBusStudentsCount,
        this.pickedStudentsCount,
        this.totalStudentsCountExcludingStudentsOnScheduledLeave});

  StopsList.fromJson(Map<String, dynamic> json) {
    stopOrder = json['stopOrder'];
    stop = json['stop'] != null ? new Stop.fromJson(json['stop']) : null;
    scheduledArrivalTime = json['scheduledArrivalTime'];
    scheduledDepartureTime = json['scheduledDepartureTime'];
    missedBusStudentsCount = json['missedBusStudentsCount'];
    pickedStudentsCount = json['pickedStudentsCount'];
    totalStudentsCountExcludingStudentsOnScheduledLeave =
    json['totalStudentsCountExcludingStudentsOnScheduledLeave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stopOrder'] = this.stopOrder;
    if (this.stop != null) {
      data['stop'] = this.stop!.toJson();
    }
    data['scheduledArrivalTime'] = this.scheduledArrivalTime;
    data['scheduledDepartureTime'] = this.scheduledDepartureTime;
    data['missedBusStudentsCount'] = this.missedBusStudentsCount;
    data['pickedStudentsCount'] = this.pickedStudentsCount;
    data['totalStudentsCountExcludingStudentsOnScheduledLeave'] =
        this.totalStudentsCountExcludingStudentsOnScheduledLeave;
    return data;
  }
}

class Stop {
  int? stopID;
  String? stopName;
  String? stopLatitude;
  String? stopLongitude;

  Stop({this.stopID, this.stopName, this.stopLatitude, this.stopLongitude});

  Stop.fromJson(Map<String, dynamic> json) {
    stopID = json['stopID'];
    stopName = json['stopName'];
    stopLatitude = json['stopLatitude'];
    stopLongitude = json['stopLongitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stopID'] = this.stopID;
    data['stopName'] = this.stopName;
    data['stopLatitude'] = this.stopLatitude;
    data['stopLongitude'] = this.stopLongitude;
    return data;
  }
}
