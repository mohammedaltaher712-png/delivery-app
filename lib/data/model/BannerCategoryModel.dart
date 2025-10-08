class BannerCategoryModel {
  int? bannerCategorysId;
  String? bannerCategorysImage;
  int? bannerCategorysCategory;

  BannerCategoryModel(
      {this.bannerCategorysId,
      this.bannerCategorysImage,
      this.bannerCategorysCategory});

  BannerCategoryModel.fromJson(Map<String, dynamic> json) {
    bannerCategorysId = json['banner_categorys_id'];
    bannerCategorysImage = json['banner_categorys_image'];
    bannerCategorysCategory = json['banner_categorys_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_categorys_id'] = this.bannerCategorysId;
    data['banner_categorys_image'] = this.bannerCategorysImage;
    data['banner_categorys_category'] = this.bannerCategorysCategory;
    return data;
  }
}