import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/address_data.dart';
import 'package:order_delivery_application/data/coupon_data.dart';
import 'package:order_delivery_application/data/model/Addressmodel.dart';
import 'package:order_delivery_application/data/model/cardpricemodle.dart';
import 'package:order_delivery_application/data/model/couponmodle.dart';
import 'package:order_delivery_application/data/model/paymentmodle.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';
import 'package:order_delivery_application/data/static/pament.dart';

class InvoiceController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CouponData couponData = CouponData(Get.find());

  List<CartModle> CartView = [];
  double totalPrice = 0.0;
  int? discountcoupon = 0;
  MyServices myserivce = Get.find();
  List<CouponModle> coupon = [];
  List<PaymentModle> Paymentshow = [];

  String? couponname;
  CouponModle? couponModle;
  int? couponid;
  int statuscoupon = 0;
  int? currentIndexPayment;
  Rxn<AddressModel> selectedAddress = Rxn<AddressModel>();
  late TextEditingController comments;
  SerivecsModel? serivecsModel;

  double get finalTotalWithDelivery {
    double discountedPrice = totalPrice;
    if (statuscoupon != 0 && discountcoupon != null) {
      discountedPrice = totalPrice - (totalPrice * discountcoupon! / 100);
    }
    return discountedPrice + deliveryPrice;
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await couponData.Couponview(
      myserivce.sharedPreferences.getString("token").toString(),
    );

    print("=============================== Contdsroller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];

        // ✅ حفظ الكوبونات في قائمة
        coupon.clear(); // تأكد من تنظيف القائمة أولاً
        coupon.addAll(data.map((e) => CouponModle.fromJson(e)));

        // ✅ أخذ أول كوبون فقط إذا فيه بيانات
        if (data.isNotEmpty) {
          couponModle = CouponModle.fromJson(data[0]);
          discountcoupon = couponModle!.couponsDiscount;
          couponname = couponModle!.couponsName;
          couponid = couponModle!.couponsId;
        } else {
          discountcoupon = 0;
          couponname = null;
          couponid = 0;
        }
      } else {}
    }

    update();
  }

  Payment() async {
    Paymentshow.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await couponData.Paymentview(
      myserivce.sharedPreferences.getString("token").toString(),
    );
    // print("=============================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];

        Paymentshow.addAll(data.map((e) => PaymentModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deliveryPriceShow() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await couponData.deliveryPriceShow();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        // هنا يجب تخزين السعر في المتغير deliveryPrice
        if (data.isNotEmpty) {
          deliveryPrice = data[0]['delivery_prices_prices'].toDouble();
          print(deliveryPrice);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void setSelectedCoupon(List<dynamic> selected) {
    coupon = selected.map((e) => e as CouponModle).toList();
    update();
  }

  changePayment(val) {
    currentIndexPayment = val;
    print(currentIndexPayment);
    update();
  }

  checkout() async {
    if (currentIndexPayment == null) {
      return Get.snackbar(
        "خطأ",
        "الرجاء اختيار طريقة الدفع",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
        icon: const Icon(Icons.attach_money, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      );
    }
    if (selectedAddress.value.isNull) {
      return Get.snackbar(
        "خطأ",
        "الرجاء تحديد موقعك",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
        icon: const Icon(Icons.location_on, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      );
    }
    if (couponid != 0 && statuscoupon == 0) {
      return Get.snackbar(
        "خطأ",
        "الرجاء تفعيل الخصم",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
        icon: const Icon(Icons.discount, color: Colors.white),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      );
    }

    statusRequest = StatusRequest.loading;

    update();
    print(totalPrice.toStringAsFixed(0));
    Map data = {
      "orders_address": selectedAddress.value!.addressusersId.toString(),
      "orders_address_serivce": serivecsModel!.addressservicesId.toString(),

      "orders_coupon": couponid.toString(),
      "orders_services": serivecsModel!.servicesId.toString(),
      "orders_pricedelivery": deliveryPrice.toStringAsFixed(0),
      "orders_price": totalPrice.toStringAsFixed(0),
      "discountcoupon": discountcoupon.toString(),
      "orders_status": 1.toString(),
      "orders_paymentmethod": currentIndexPayment.toString(),
      "orders_comments": comments.text.toString(),
    };

    var response = await couponData.ordersadd(
      myserivce.sharedPreferences.getString("token").toString(),
      data,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.toNamed(Approute.OrderHistory);
        Get.snackbar("نجاح", "تم الطلب بنجاح");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("خطأ", "حاول مرة أخرى");
      }
      // End
    }
    update();
  }

  double? distanceInKm;

  Future<double> calculateDistanceBetweenUserAndService() async {
    
    print("📌 جاري حساب المسافة...");
    print("  - userLat: ${selectedAddress.value?.addressusersLatitude}");
    print("  - userLng: ${selectedAddress.value?.addressusersLongitude}");
    print("  - serviceLat: ${serivecsModel?.addressservicesLatitude}");
    print("  - serviceLng: ${serivecsModel?.addressservicesLongitude}");

    if (selectedAddress.value == null || serivecsModel == null) {
      print("❌ لا توجد بيانات كافية لحساب المسافة");
      return 0.0;
    }

    try {
      double distanceInMeters = Geolocator.distanceBetween(
        serivecsModel!.addressservicesLatitude!.toDouble(),
        serivecsModel!.addressservicesLongitude!.toDouble(),
        selectedAddress.value!.addressusersLatitude!.toDouble(),
        selectedAddress.value!.addressusersLongitude!.toDouble(),
      );

      double distanceInKm = distanceInMeters / 1000;
      // print("✅ تم حساب المسافة: ${distanceInKm.toStringAsFixed(2)} كم");
      return distanceInKm;
    } catch (e) {
      print("❌ خطأ أثناء حساب المسافة: $e");
      return 0.0;
    }
  }

  double deliveryPrice = 0.0;
  double calculatePrice(double distanceInKm) {
    // لو المسافة أقل من 0.1، نخلي السعر 100 ريال كحد أدنى
    if (distanceInKm <= 0.1) {
      return 100; // 100 ريال كحد أدنى إذا كانت المسافة أقل من 0.1 كم
    } else {
      print("===============================");

      print(deliveryPrice);
      return (distanceInKm / 0.1) * deliveryPrice;
    }
  }

  intialData() async {
    comments = TextEditingController();

    bool isConnected = await checkInternetWithDialog(intialData);
    if (!isConnected) return;
    statusRequest = StatusRequest.loading;
    update();
    checkcoupon();
    deliveryPriceShow();

    Payment();

    if (Get.arguments != null && Get.arguments['CartView'] != null) {
      CartView = Get.arguments['CartView'];
      totalPrice = Get.arguments['totalPrice'];
      serivecsModel = Get.arguments['serivecsModel'];
    } else {
      statusRequest = StatusRequest.failure;

      update();
      return;
    }

    if (Get.arguments != null && Get.arguments["address"] != null) {
      selectedAddress.value = Get.arguments["address"];
    } else {
      update();
      return;
    }
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() async {
    intialData();
    super.onInit();
  }
}
