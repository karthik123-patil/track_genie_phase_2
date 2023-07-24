class GetSchoolContacts {
  bool? responseStatus;
  String? responseMessage;
  Data? data;

  GetSchoolContacts({this.responseStatus, this.responseMessage, this.data});

  GetSchoolContacts.fromJson(Map<String, dynamic> json) {
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
  List<int>? schoolAdministrator;
  int? schoolFrontDesk;

  Data({this.schoolAdministrator, this.schoolFrontDesk});

  Data.fromJson(Map<String, dynamic> json) {
    schoolAdministrator = json['School Administrator'].cast<int>();
    schoolFrontDesk = json['School Front Desk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['School Administrator'] = this.schoolAdministrator;
    data['School Front Desk'] = this.schoolFrontDesk;
    return data;
  }
}
