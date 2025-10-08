class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategory;

  ItemsModel(
      {this.itemsId, this.itemsName, this.itemsImage, this.itemsCategory});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategory = json['items_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_image'] = this.itemsImage;
    data['items_category'] = this.itemsCategory;
    return data;
  }
}