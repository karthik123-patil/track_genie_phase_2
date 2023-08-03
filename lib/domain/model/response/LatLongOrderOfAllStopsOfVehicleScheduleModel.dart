class LatLongOrderOfAllStopsOfVehicleScheduleModel {
  bool? responseStatus;
  String? responseMessage;
  List<Data>? data;

  LatLongOrderOfAllStopsOfVehicleScheduleModel(
      {this.responseStatus, this.responseMessage, this.data});

  LatLongOrderOfAllStopsOfVehicleScheduleModel.fromJson(
      Map<String, dynamic> json) {
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
  int? id;
  Stop? stop;
  Route? route;
  int? stopOrder;

  Data({this.id, this.stop, this.route, this.stopOrder});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stop = json['stop'] != null ? new Stop.fromJson(json['stop']) : null;
    route = json['route'] != null ? new Route.fromJson(json['route']) : null;
    stopOrder = json['stopOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.stop != null) {
      data['stop'] = this.stop!.toJson();
    }
    if (this.route != null) {
      data['route'] = this.route!.toJson();
    }
    data['stopOrder'] = this.stopOrder;
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

class Route {
  int? routeID;
  String? routeName;

  Route({this.routeID, this.routeName});

  Route.fromJson(Map<String, dynamic> json) {
    routeID = json['routeID'];
    routeName = json['routeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routeID'] = this.routeID;
    data['routeName'] = this.routeName;
    return data;
  }
}
