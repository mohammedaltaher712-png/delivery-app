class SerivecswithcategoryModel {
  int? servicesId;
  String? servicesName;
  String? servicesDescription;
  String? servicesIcon;
  String? servicesImage;
  int? servicesStatus;
  int? servicesCategory;
  String? createdAt;
  String? updatedAt;

  SerivecswithcategoryModel(
      {this.servicesId,
      this.servicesName,
      this.servicesDescription,
      this.servicesIcon,
      this.servicesImage,
      this.servicesStatus,
      this.servicesCategory,
      this.createdAt,
      this.updatedAt});

  SerivecswithcategoryModel.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesDescription = json['services_description'];
    servicesIcon = json['services_icon'];
    servicesImage = json['services_image'];
    servicesStatus = json['services_status'];
    servicesCategory = json['services_category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['services_id'] = this.servicesId;
    data['services_name'] = this.servicesName;
    data['services_description'] = this.servicesDescription;
    data['services_icon'] = this.servicesIcon;
    data['services_image'] = this.servicesImage;
    data['services_status'] = this.servicesStatus;
    data['services_category'] = this.servicesCategory;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}