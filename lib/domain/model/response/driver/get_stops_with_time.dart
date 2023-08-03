class StopsWithTimeList {
  bool? responseStatus;
  String? responseMessage;
  List<Data>? data;

  StopsWithTimeList({this.responseStatus, this.responseMessage, this.data});

  StopsWithTimeList.fromJson(Map<String, dynamic> json) {
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
  int? stopOrder;
  Stop? stop;
  String? scheduledArrivalTime;
  String? scheduledDepartureTime;
  int? missedBusStudentsCount;
  int? pickedStudentsCount;
  int? totalStudentsCountExcludingStudentsOnScheduledLeave;

  Data(
      {this.stopOrder,
        this.stop,
        this.scheduledArrivalTime,
        this.scheduledDepartureTime,
        this.missedBusStudentsCount,
        this.pickedStudentsCount,
        this.totalStudentsCountExcludingStudentsOnScheduledLeave});

  Data.fromJson(Map<String, dynamic> json) {
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