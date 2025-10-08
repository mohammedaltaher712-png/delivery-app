class QuantityModle {
  int? quantitysId;
  String? quantitysName;
  int? quantitysPrice;          // غيرت من String? إلى int?
  int? quantitysMenuDetails;
  int? addedQuantity;           // غيرت من String? إلى int?
  int? addedTotalPrice;

  QuantityModle({
    this.quantitysId,
    this.quantitysName,
    this.quantitysPrice,
    this.quantitysMenuDetails,
    this.addedQuantity,
    this.addedTotalPrice,
  });

  QuantityModle.fromJson(Map<String, dynamic> json) {
    quantitysId = json['quantitys_id'];
    quantitysName = json['quantitys_name'];
    quantitysPrice = json['quantitys_price'] is int
        ? json['quantitys_price']
        : int.tryParse(json['quantitys_price'].toString()) ?? 0;
    quantitysMenuDetails = json['quantitys_menu_details'];
    addedQuantity = json['added_quantity'] is int
        ? json['added_quantity']
        : int.tryParse(json['added_quantity'].toString()) ?? 0;
    addedTotalPrice = json['added_total_price'] is int
        ? json['added_total_price']
        : int.tryParse(json['added_total_price'].toString()) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantitys_id'] = quantitysId;
    data['quantitys_name'] = quantitysName;
    data['quantitys_price'] = quantitysPrice;
    data['quantitys_menu_details'] = quantitysMenuDetails;
    data['added_quantity'] = addedQuantity;
    data['added_total_price'] = addedTotalPrice;
    return data;
  }
}
