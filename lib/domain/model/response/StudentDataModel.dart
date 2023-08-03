class StudentDataModel {
  bool? responseStatus;
  String? responseMessage;
  List<Data>? data;

  StudentDataModel({this.responseStatus, this.responseMessage, this.data});

  StudentDataModel.fromJson(Map<String, dynamic> json) {
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
  int? userID;
  String? userName;
  String? userUniqueKey;
  String? userStatus;
  String? userPhoto;
  String? userAddress;

  Data(
      {this.userID,
        this.userName,
        this.userUniqueKey,
        this.userStatus,
        this.userPhoto,
        this.userAddress});

  Data.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    userUniqueKey = json['userUniqueKey'];
    userStatus = json['userStatus'];
    userPhoto = json['userPhoto'];
    userAddress = json['userAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['userUniqueKey'] = this.userUniqueKey;
    data['userStatus'] = this.userStatus;
    data['userPhoto'] = this.userPhoto;
    data['userAddress'] = this.userAddress;
    return data;
  }
}
