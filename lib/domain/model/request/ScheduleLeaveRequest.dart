class ScheduleLeaveRequest {
  String? userID;
  String? typeOfJourney;
  String? startDate;
  String? endDate;

  ScheduleLeaveRequest(
      {this.userID, this.typeOfJourney, this.startDate, this.endDate});

  ScheduleLeaveRequest.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    typeOfJourney = json['typeOfJourney'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userID'] =  userID;
    data['typeOfJourney'] =  typeOfJourney;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}