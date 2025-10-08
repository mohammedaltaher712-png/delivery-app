class MenuDetailModel {
  int? menuDetailsId;
  String? menuDetailsName;
  String? menuDetailsDescription;
  String? menuDetailsPrice;
  String? menuDetailsImage;
  int? menuDetailsMenus;
  int? menuDetailsServices;

  MenuDetailModel(
      {this.menuDetailsId,
      this.menuDetailsName,
      this.menuDetailsDescription,
      this.menuDetailsPrice,
      this.menuDetailsImage,
      this.menuDetailsMenus,
      this.menuDetailsServices});

  MenuDetailModel.fromJson(Map<String, dynamic> json) {
    menuDetailsId = json['menu_details_id'];
    menuDetailsName = json['menu_details_name'];
    menuDetailsDescription = json['menu_details_description'];
    menuDetailsPrice = json['menu_details_price'];
    menuDetailsImage = json['menu_details_image'];
    menuDetailsMenus = json['menu_details_menus'];
    menuDetailsServices = json['menu_details_services'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_details_id'] = this.menuDetailsId;
    data['menu_details_name'] = this.menuDetailsName;
    data['menu_details_description'] = this.menuDetailsDescription;
    data['menu_details_price'] = this.menuDetailsPrice;
    data['menu_details_image'] = this.menuDetailsImage;
    data['menu_details_menus'] = this.menuDetailsMenus;
    data['menu_details_services'] = this.menuDetailsServices;
    return data;
  }
}