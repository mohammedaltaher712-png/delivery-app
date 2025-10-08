class cardnummodle {
  int? cartsQuantitys;
  int? count;

  cardnummodle({this.cartsQuantitys, this.count});

  cardnummodle.fromJson(Map<String, dynamic> json) {
    cartsQuantitys = json['carts_quantitys'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carts_quantitys'] = this.cartsQuantitys;
    data['count'] = this.count;
    return data;
  }
}