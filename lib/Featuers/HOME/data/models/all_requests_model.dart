class AllRequestsModel {
  bool? status;
  String? message;
  int? statusNumber;
  List<Requests>? requests;

  AllRequestsModel(
      {this.status, this.message, this.statusNumber, this.requests});

  AllRequestsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusNumber = json['statusNumber'];
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(new Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['statusNumber'] = this.statusNumber;
    if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  int? id;
  String? paymentState;
  String? receiveState;
  double? price;

  Requests({this.id, this.paymentState, this.receiveState, this.price});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentState = json['payment_state'];
    receiveState = json['receive_state'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['payment_state'] = this.paymentState;
    data['receive_state'] = this.receiveState;
    data['price'] = this.price;
    return data;
  }
}
