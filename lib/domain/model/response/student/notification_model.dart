class NotificationResModel {
  bool? responseStatus;
  String? responseMessage;
  List<Data>? data;
  int? passValue;

  NotificationResModel(
      {this.responseStatus, this.responseMessage, this.data, this.passValue});

  NotificationResModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    passValue = json['passValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseStatus'] = this.responseStatus;
    data['responseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['passValue'] = this.passValue;
    return data;
  }
}

class Data {
  String? date;
  String? scheduledLeaveReturnJourney;
  String? missedBusReturnJourney;
  String? reachedHome;
  String? pickedUpFromSchool;
  String? scheduledLeaveOnwardJourney;
  String? missedBusOnwardJourney;
  String? reachedSchool;
  String? pickedUpFromHome;

  Data(
      {this.date,
        this.scheduledLeaveReturnJourney,
        this.missedBusReturnJourney,
        this.reachedHome,
        this.pickedUpFromSchool,
        this.scheduledLeaveOnwardJourney,
        this.missedBusOnwardJourney,
        this.reachedSchool,
        this.pickedUpFromHome});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    scheduledLeaveReturnJourney = json['scheduled_Leave_Return_Journey'];
    missedBusReturnJourney = json['missed_Bus_Return_Journey'];
    reachedHome = json['reached_Home'];
    pickedUpFromSchool = json['picked_up_from_school'];
    scheduledLeaveOnwardJourney = json['scheduled_Leave_Onward_Journey'];
    missedBusOnwardJourney = json['missed_Bus_Onward_Journey'];
    reachedSchool = json['reached_School'];
    pickedUpFromHome = json['picked_Up_from_home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['scheduled_Leave_Return_Journey'] = this.scheduledLeaveReturnJourney;
    data['missed_Bus_Return_Journey'] = this.missedBusReturnJourney;
    data['reached_Home'] = this.reachedHome;
    data['picked_up_from_school'] = this.pickedUpFromSchool;
    data['scheduled_Leave_Onward_Journey'] = this.scheduledLeaveOnwardJourney;
    data['missed_Bus_Onward_Journey'] = this.missedBusOnwardJourney;
    data['reached_School'] = this.reachedSchool;
    data['picked_Up_from_home'] = this.pickedUpFromHome;
    return data;
  }
}