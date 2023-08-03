class UpdateLatLongRequest {
  int? tripID;
  int? stopID;
  String? time;
  String? busCurrentLat;
  String? busCurrentLong;

  UpdateLatLongRequest(
      {this.tripID,
        this.stopID,
        this.time,
        this.busCurrentLat,
        this.busCurrentLong});

  UpdateLatLongRequest.fromJson(Map<String, dynamic> json) {
    tripID = json['tripID'];
    stopID = json['stopID'];
    time = json['time'];
    busCurrentLat = json['busCurrentLat'];
    busCurrentLong = json['busCurrentLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripID'] = this.tripID;
    data['stopID'] = this.stopID;
    data['time'] = this.time;
    data['busCurrentLat'] = this.busCurrentLat;
    data['busCurrentLong'] = this.busCurrentLong;
    return data;
  }
}