class HomeBannerModle {
  int? bannerHomesId;
  String? bannerHomesImage;

  HomeBannerModle({this.bannerHomesId, this.bannerHomesImage});

  HomeBannerModle.fromJson(Map<String, dynamic> json) {
    bannerHomesId = json['banner_homes_id'];
    bannerHomesImage = json['banner_homes_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_homes_id'] = this.bannerHomesId;
    data['banner_homes_image'] = this.bannerHomesImage;
    return data;
  }
}