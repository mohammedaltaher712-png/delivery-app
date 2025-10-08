class Linkapi {
  ////////////////routeapi/////////////
  static const String image = "http://192.168.1.101:8000/storage";
  static const String linkroute = "http://192.168.1.101:8000/api";
  ////////////////////apiData////////////////
  static String login = "$linkroute/UserAuth/login";
  static String register = "$linkroute/UserAuth/register";
  /////////Home///////////////////////////
  static String bannerhome = "$linkroute/BannerHome/showAll";
  static String cate = "$linkroute/Category/showAll";

  //////////////category//////////////
  static String bannercategory = "$linkroute/BannerCategory/Show";
  static String items = "$linkroute/items/Show";
  static String Serivecs = "$linkroute/Services/Show";
  static String Serivecscate = "$linkroute/Serivecs/Showcate";
    static String Serivecssearch = "$linkroute/Services/search";

  ////////////Menu///////////////////////
  static String menushow = "$linkroute/Menu/Show";
  ////////////list_detais///////////////////////

  static String list_detais = "$linkroute/Menu_Detail/Show";
  static String list_detais2 = "$linkroute/list_detaisusers/Showcate";

  static String Addaddress = "$linkroute/Address/add";
  static String Showaddress = "$linkroute/Address/Show";
  static String deletedaddress = "$linkroute/Address/remove";
  ///////////////////////////////Details////////////////
// Favorite


  static const String favoriteAdd = "$linkroute/Favorite/add";
  static const String favoriteRemove = "$linkroute/Favorite/remove";
    static const String favoriteShow = "$linkroute/Favorite/Show";

  static String Detailsshow = "$linkroute/Quantity/Show";
  //////////////////card///////////////////////////////////
  static String cardadd = "$linkroute/Card/add";
  static String cardnum = "$linkroute/Card/Show";
  static String cardRemve = "$linkroute/Card/remove";
    static String cardRemveAll = "$linkroute/Card/removeAll";

  static String cardviewprice = "$linkroute/Card/showCartView";
  static String couponview = "$linkroute/Coupon/Show";
  static String Paymentview = "$linkroute/Payment/Show";
  static String ordersadd = "$linkroute/orders/add";
  static String ordersShow = "$linkroute/orders/Show";
  static String deliveryPriceShow = "$linkroute/deliveryPrice/Show";

  ////////////////apiimages
  static const String categoiresimage = "$image/categoryimage";
  static const String homebannersimage = "$image/bannerhome";
  static const String bannercategoryimage = "$image/bannercategory";
  static const String itemsimage = "$image/itemsimage";
  static const String Servicesimage = "$image/servicesimage";
  static const String Servicesicons = "$image/servicesicon";
  static const String menudetailsimage = "$image/menudetailsimage";
    static const String Patmentsiconssimage = "$image/paymenticons";

}
