class CsrfTokenModel {
  bool? status;
  String? csrfToken;
  int? statusNumber;

  CsrfTokenModel({this.status, this.csrfToken, this.statusNumber});

  CsrfTokenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    csrfToken = json['csrf_token'];
    statusNumber = json['statusNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['csrf_token'] = this.csrfToken;
    data['statusNumber'] = this.statusNumber;
    return data;
  }
}
