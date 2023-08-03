class StudentInfo {
  String? strName;
  String? strContactNo;
  String? strUniqueId;
  String? strAddress;
  String? strPhoto;
  String? strEmail;

  StudentInfo(
      {this.strName,
        this.strContactNo,
        this.strUniqueId,
        this.strAddress,
        this.strPhoto, this.strEmail});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    strName = json['strName'];
    strContactNo = json['strContactNo'];
    strUniqueId = json['strUniqueId'];
    strAddress = json['strAddress'];
    strPhoto = json['strPhoto'];
    strEmail = json['strEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['strName'] = strName;
    data['strContactNo'] = strContactNo;
    data['strUniqueId'] = strUniqueId;
    data['strAddress'] = strAddress;
    data['strPhoto'] = strPhoto;
    data['strEmail'] = strEmail;
    return data;
  }
}
