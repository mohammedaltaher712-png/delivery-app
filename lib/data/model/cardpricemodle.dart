class CartModle {
  int? cartsQuantitys;
  int? quantityCount;
  int? totalPrice;
  String? quantityName;
  int? quantitysId;
  String? unitPrice;
  int? usersId;
  String? usersName;
  String? usersEmail;
  int? usersPhone;
  int? menuDetailsId;
  String? menuDetailsName;
  String? menuDetailsImage;
  String? menuDetailsDescription;

  CartModle(
      {this.cartsQuantitys,
      this.quantityCount,
      this.totalPrice,
      this.quantityName,
      this.quantitysId,
      this.unitPrice,
      this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.menuDetailsId,
      this.menuDetailsName,
      this.menuDetailsImage,
      this.menuDetailsDescription});

  CartModle.fromJson(Map<String, dynamic> json) {
    cartsQuantitys = json['carts_quantitys'];
    quantityCount = json['quantity_count'];
    totalPrice = json['total_price'];
    quantityName = json['quantity_name'];
    quantitysId = json['quantitys_id'];
    unitPrice = json['unit_price'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    menuDetailsId = json['menu_details_id'];
    menuDetailsName = json['menu_details_name'];
    menuDetailsImage = json['menu_details_image'];
    menuDetailsDescription = json['menu_details_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carts_quantitys'] = this.cartsQuantitys;
    data['quantity_count'] = this.quantityCount;
    data['total_price'] = this.totalPrice;
    data['quantity_name'] = this.quantityName;
    data['quantitys_id'] = this.quantitysId;
    data['unit_price'] = this.unitPrice;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    data['menu_details_id'] = this.menuDetailsId;
    data['menu_details_name'] = this.menuDetailsName;
    data['menu_details_image'] = this.menuDetailsImage;
    data['menu_details_description'] = this.menuDetailsDescription;
    return data;
  }
}