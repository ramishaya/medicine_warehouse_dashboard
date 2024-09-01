class ChanngeStateModel {
  bool? status;
  String? message;
  int? statusNumber;

  ChanngeStateModel({this.status, this.message, this.statusNumber});

  ChanngeStateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusNumber = json['statusNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['statusNumber'] = this.statusNumber;
    return data;
  }
}
