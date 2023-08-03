class PostModel {
  PostModel({
      this.responseStatus, 
      this.responseMessage,});

  PostModel.fromJson(dynamic json) {
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
  }
  bool? responseStatus;
  String? responseMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseStatus'] = responseStatus;
    map['responseMessage'] = responseMessage;
    return map;
  }

}