class GetScheduledLeave {
  bool? responseStatus;
  String? responseMessage;
  List<String>? data;

  GetScheduledLeave({this.responseStatus, this.responseMessage, this.data});

  GetScheduledLeave.fromJson(Map<String, dynamic> json) {
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['responseStatus'] =  responseStatus;
    data['responseMessage'] =  responseMessage;
    data['data'] = this.data;
    return data;
  }
}