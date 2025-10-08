class CategoiresModel {
  int? categoryId;
  String? categoryName;
  String? categoryImage;

  CategoiresModel({this.categoryId, this.categoryName, this.categoryImage});

  CategoiresModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    return data;
  }
}
