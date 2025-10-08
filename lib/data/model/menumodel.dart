class MenuModel {
  int? menusId;
  String? menusName;
  int? menusServices;

  MenuModel({this.menusId, this.menusName, this.menusServices});

  MenuModel.fromJson(Map<String, dynamic> json) {
    menusId = json['menus_id'];
    menusName = json['menus_name'];
    menusServices = json['menus_services'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menus_id'] = this.menusId;
    data['menus_name'] = this.menusName;
    data['menus_services'] = this.menusServices;
    return data;
  }
}