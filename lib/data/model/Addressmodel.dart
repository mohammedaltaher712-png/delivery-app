class AddressModel {
  int? addressusersId;
  String? addressusersName;
  String? addressusersDescription;
  double? addressusersLatitude;
  double? addressusersLongitude;  // <-- غيرنا النوع من int? إلى double?
  int? addressusersUsers;

  AddressModel(
      {this.addressusersId,
      this.addressusersName,
      this.addressusersDescription,
      this.addressusersLatitude,
      this.addressusersLongitude,
      this.addressusersUsers});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressusersId = json['addressusers_id'];
    addressusersName = json['addressusers_name'];
    addressusersDescription = json['addressusers_description'];
    addressusersLatitude = (json['addressusers_latitude'] as num?)?.toDouble();
    addressusersLongitude = (json['addressusers_longitude'] as num?)?.toDouble();
    addressusersUsers = json['addressusers_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressusers_id'] = this.addressusersId;
    data['addressusers_name'] = this.addressusersName;
    data['addressusers_description'] = this.addressusersDescription;
    data['addressusers_latitude'] = this.addressusersLatitude;
    data['addressusers_longitude'] = this.addressusersLongitude;
    data['addressusers_users'] = this.addressusersUsers;
    return data;
  }
}
