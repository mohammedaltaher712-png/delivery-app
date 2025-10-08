class OrdersModle {
  int? quantityCount;
  String? totalPrice; // ← عدلناه إلى String
  int? cartsOrders;
  int? cartsMenuDetails;
  int? cartsQuantitys;
  String? menuDetailsName;
  String? menuDetailsDescription;
  String? menuDetailsImage;
  String? quantitysName;
  String? quantitysPrice;
  int? ordersId;
  int? ordersUser;
  int? ordersAddress;
  int? ordersCoupon;
  int? ordersServices;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersComments;
  String? createdAt;
  String? updatedAt;
  int? addressusersId;
  String? addressusersName;
  String? addressusersDescription;
  int? paymentsId;
  String? paymentsName;
  String? paymentsIcon;
  int? couponsId;
  String? couponsName;
  int? couponsDiscount;
  int? couponsUser;
  int? couponsBelongsService;
  String? couponsStartDate;
  String? couponsEndDate;

  int? servicesId;
  String? servicesName;
  String? servicesDescription;
  String? servicesIcon;
  String? servicesImage;
  int? servicesStatus;
  int? servicesBelongs;
  int? servicesCategory;

  OrdersModle({
    this.quantityCount,
    this.totalPrice,
    this.cartsOrders,
    this.cartsMenuDetails,
    this.cartsQuantitys,
    this.menuDetailsName,
    this.menuDetailsDescription,
    this.menuDetailsImage,
    this.quantitysName,
    this.quantitysPrice,
    this.ordersId,
    this.ordersUser,
    this.ordersAddress,
    this.ordersCoupon,
    this.ordersServices,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersPaymentmethod,
    this.ordersStatus,
    this.ordersComments,
    this.createdAt,
    this.updatedAt,
    this.addressusersId,
    this.addressusersName,
    this.addressusersDescription,
    this.paymentsId,
    this.paymentsName,
    this.paymentsIcon,
    this.couponsId,
    this.couponsName,
    this.couponsDiscount,
    this.couponsUser,
    this.couponsBelongsService,
    this.couponsStartDate,
    this.couponsEndDate,
    this.servicesId,
    this.servicesName,
    this.servicesDescription,
    this.servicesIcon,
    this.servicesImage,
    this.servicesStatus,
    this.servicesBelongs,
    this.servicesCategory,
  });

  OrdersModle.fromJson(Map<String, dynamic> json) {
    quantityCount = json['quantity_count'];
    totalPrice = json['total_price']?.toString(); // ← نحولها إلى String إن لم تكن
    cartsOrders = json['carts_orders'];
    cartsMenuDetails = json['carts_menu_details'];
    cartsQuantitys = json['carts_quantitys'];
    menuDetailsName = json['menu_details_name'];
    menuDetailsDescription = json['menu_details_description'];
    menuDetailsImage = json['menu_details_image'];
    quantitysName = json['quantitys_name'];
    quantitysPrice = json['quantitys_price'];
    ordersId = json['orders_id'];
    ordersUser = json['orders_user'];
    ordersAddress = json['orders_address'];
    ordersCoupon = json['orders_coupon'];
    ordersServices = json['orders_services'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersComments = json['orders_comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addressusersId = json['addressusers_id'];
    addressusersName = json['addressusers_name'];
    addressusersDescription = json['addressusers_description'];
    paymentsId = json['payments_id'];
    paymentsName = json['payments_name'];
    paymentsIcon = json['payments_icon'];
    couponsId = json['coupons_id'];
    couponsName = json['coupons_name'];
    couponsDiscount = json['coupons_discount'];
    couponsUser = json['coupons_user'];
    couponsBelongsService = json['coupons_belongs_service'];
    couponsStartDate = json['coupons_start_date'];
    couponsEndDate = json['coupons_end_date'];
    servicesId = json['services_id'];
    servicesName = json['services_name'];
    servicesDescription = json['services_description'];
    servicesIcon = json['services_icon'];
    servicesImage = json['services_image'];
    servicesStatus = json['services_status'];
    servicesBelongs = json['services_belongs'];
    servicesCategory = json['services_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['quantity_count'] = quantityCount;
    data['total_price'] = totalPrice;
    data['carts_orders'] = cartsOrders;
    data['carts_menu_details'] = cartsMenuDetails;
    data['carts_quantitys'] = cartsQuantitys;
    data['menu_details_name'] = menuDetailsName;
    data['menu_details_description'] = menuDetailsDescription;
    data['menu_details_image'] = menuDetailsImage;
    data['quantitys_name'] = quantitysName;
    data['quantitys_price'] = quantitysPrice;
    data['orders_id'] = ordersId;
    data['orders_user'] = ordersUser;
    data['orders_address'] = ordersAddress;
    data['orders_coupon'] = ordersCoupon;
    data['orders_services'] = ordersServices;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_comments'] = ordersComments;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['addressusers_id'] = addressusersId;
    data['addressusers_name'] = addressusersName;
    data['addressusers_description'] = addressusersDescription;
    data['payments_id'] = paymentsId;
    data['payments_name'] = paymentsName;
    data['payments_icon'] = paymentsIcon;
    data['coupons_id'] = couponsId;
    data['coupons_name'] = couponsName;
    data['coupons_discount'] = couponsDiscount;
    data['coupons_user'] = couponsUser;
    data['coupons_belongs_service'] = couponsBelongsService;
    data['coupons_start_date'] = couponsStartDate;
    data['coupons_end_date'] = couponsEndDate;
    data['services_id'] = servicesId;
    data['services_name'] = servicesName;
    data['services_description'] = servicesDescription;
    data['services_icon'] = servicesIcon;
    data['services_image'] = servicesImage;
    data['services_status'] = servicesStatus;
    data['services_belongs'] = servicesBelongs;
    data['services_category'] = servicesCategory;
    return data;
  }
}
