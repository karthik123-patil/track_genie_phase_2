class StudentInfo {
  String? strName;
  String? strContactNo;
  String? strUniqueId;
  String? strAddress;
  String? strPhoto;

  StudentInfo(
      {this.strName,
        this.strContactNo,
        this.strUniqueId,
        this.strAddress,
        this.strPhoto});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    strName = json['strName'];
    strContactNo = json['strContactNo'];
    strUniqueId = json['strUniqueId'];
    strAddress = json['strAddress'];
    strPhoto = json['strPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strName'] = this.strName;
    data['strContactNo'] = this.strContactNo;
    data['strUniqueId'] = this.strUniqueId;
    data['strAddress'] = this.strAddress;
    data['strPhoto'] = this.strPhoto;
    return data;
  }
}
