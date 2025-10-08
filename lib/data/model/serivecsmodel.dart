class SerivecsModel {
  int? servicesId;
  String? servicesName;
  String? servicesDescription;
  String? servicesIcon;
  String? servicesImage;
  int? servicesStatus;
  int? servicesCategory;
  int? servicesBelongs;
  int? addressservicesId;
  String? addressservicesName;
  String? addressservicesDescription;
  double? addressservicesLatitude;
  double? addressservicesLongitude;
  int? favoritesId;
  int? favoritesUser;
  int? favoritesServices;
  int? itemsId;
  String? itemsName;
  String? itemsImage;
  int? itemsCategory;
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  int? serviceProviderId;
  String? serviceProviderName;
  String? serviceProviderEmail;
  String? serviceProviderPhone;
  int? favorite;

  SerivecsModel(
      {this.servicesId,
      this.servicesName,
      this.servicesDescription,
      this.servicesIcon,
      this.servicesImage,
      this.servicesStatus,
      this.servicesCategory,
      this.servicesBelongs,
      this.addressservicesId,
      this.addressservicesName,
      this.addressservicesDescription,
      this.addressservicesLatitude,
      this.addressservicesLongitude,
      this.favoritesId,
      this.favoritesUser,
      this.favoritesServices,
      this.itemsId,
      this.itemsName,
      this.itemsImage,
      this.itemsCategory,
      this.categoryId,
      this.categoryName,
      this.categoryImage,
      this.serviceProviderId,
      this.serviceProviderName,
      this.serviceProviderEmail,
      this.serviceProviderPhone,
      this.favorite});

  SerivecsModel.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesDescription = json['services_description'];
    servicesIcon = json['services_icon'];
    servicesImage = json['services_image'];
    servicesStatus = json['services_status'];
    servicesCategory = json['services_category'];
    servicesBelongs = json['services_belongs'];
    addressservicesId = json['addressservices_id'];
    addressservicesName = json['addressservices_name'];
    addressservicesDescription = json['addressservices_description'];
    addressservicesLatitude = json['addressservices_latitude'];
    addressservicesLongitude = json['addressservices_longitude'];
    favoritesId = json['favorites_id'];
    favoritesUser = json['favorites_user'];
    favoritesServices = json['favorites_services'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
    itemsCategory = json['items_category'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    serviceProviderId = json['service_provider_id'];
    serviceProviderName = json['service_provider_name'];
    serviceProviderEmail = json['service_provider_email'];
    serviceProviderPhone = json['service_provider_phone'];
    favorite = json['favorite'];
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
    data['services_belongs'] = this.servicesBelongs;
    data['addressservices_id'] = this.addressservicesId;
    data['addressservices_name'] = this.addressservicesName;
    data['addressservices_description'] = this.addressservicesDescription;
    data['addressservices_latitude'] = this.addressservicesLatitude;
    data['addressservices_longitude'] = this.addressservicesLongitude;
    data['favorites_id'] = this.favoritesId;
    data['favorites_user'] = this.favoritesUser;
    data['favorites_services'] = this.favoritesServices;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_image'] = this.itemsImage;
    data['items_category'] = this.itemsCategory;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['service_provider_id'] = this.serviceProviderId;
    data['service_provider_name'] = this.serviceProviderName;
    data['service_provider_email'] = this.serviceProviderEmail;
    data['service_provider_phone'] = this.serviceProviderPhone;
    data['favorite'] = this.favorite;
    return data;
  }
}