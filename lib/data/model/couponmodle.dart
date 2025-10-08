class CouponModle {
  int? couponsId;
  String? couponsName;
  int? couponsDiscount;
  int? couponsUser;
  int? couponsBelongsService;
  String? couponsStartDate;
  String? couponsEndDate;
  int? couponsIsActive;
  int? serviceProviderId;
  String? serviceProviderName;
  String? serviceProviderEmail;
  String? serviceProviderPhone;
  int? usersId;
  String? userName;
  String? userEmail;
  int? userPhone;

  CouponModle({
    this.couponsId,
    this.couponsName,
    this.couponsDiscount,
    this.couponsUser,
    this.couponsBelongsService,
    this.couponsStartDate,
    this.couponsEndDate,
    this.couponsIsActive,
    this.serviceProviderId,
    this.serviceProviderName,
    this.serviceProviderEmail,
    this.serviceProviderPhone,
    this.usersId,
    this.userName,
    this.userEmail,
    this.userPhone,
  });

  /// ✅ Factory method from JSON
  factory CouponModle.fromJson(Map<String, dynamic> json) {
    return CouponModle(
      couponsId: json['coupons_id'],
      couponsName: json['coupons_name'],
      couponsDiscount: json['coupons_discount'],
      couponsUser: json['coupons_user'],
      couponsBelongsService: json['coupons_belongs_service'],
      couponsStartDate: json['coupons_start_date'],
      couponsEndDate: json['coupons_end_date'],
      couponsIsActive: json['coupons_is_active'],
      serviceProviderId: json['service_provider_id'],
      serviceProviderName: json['service_provider_name'],
      serviceProviderEmail: json['service_provider_email'],
      serviceProviderPhone: json['service_provider_phone'],
      usersId: json['users_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userPhone: json['user_phone'],
    );
  }

  /// ✅ Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'coupons_id': couponsId,
      'coupons_name': couponsName,
      'coupons_discount': couponsDiscount,
      'coupons_user': couponsUser,
      'coupons_belongs_service': couponsBelongsService,
      'coupons_start_date': couponsStartDate,
      'coupons_end_date': couponsEndDate,
      'coupons_is_active': couponsIsActive,
      'service_provider_id': serviceProviderId,
      'service_provider_name': serviceProviderName,
      'service_provider_email': serviceProviderEmail,
      'service_provider_phone': serviceProviderPhone,
      'users_id': usersId,
      'user_name': userName,
      'user_email': userEmail,
      'user_phone': userPhone,
    };
  }

  /// ✅ Override equality operator (==) to compare by `couponsId`
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CouponModle && other.couponsId == couponsId;
  }

  /// ✅ Required with == operator
  @override
  int get hashCode => couponsId.hashCode;

  /// 🧾 Useful for debugging/logging
  @override
  String toString() {
    return 'CouponModle(id: $couponsId, name: $couponsName, discount: $couponsDiscount%)';
  }
}
