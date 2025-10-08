class PaymentModle {
  int? paymentsId;
  String? paymentsName;
  String? paymentsIcon;

  PaymentModle({this.paymentsId, this.paymentsName, this.paymentsIcon});

  PaymentModle.fromJson(Map<String, dynamic> json) {
    paymentsId = json['payments_id'];
    paymentsName = json['payments_name'];
    paymentsIcon = json['payments_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payments_id'] = this.paymentsId;
    data['payments_name'] = this.paymentsName;
    data['payments_icon'] = this.paymentsIcon;
    return data;
  }
}