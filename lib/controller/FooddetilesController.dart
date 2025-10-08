import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/Detail_controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/details_data.dart';
import 'package:order_delivery_application/data/model/Detailsmodle.dart';
import 'package:order_delivery_application/data/model/cardnummodle.dart';
import 'package:order_delivery_application/data/model/cardpricemodle.dart';
import 'package:order_delivery_application/data/model/list_detaismodel.dart';

import '../core/class/statusrequest.dart';

class Fooddetilescontroller extends GetxController {
  MenuDetailModel? menuDetailModel;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myserivce = Get.find();
  DetailController DeController = Get.find();

  // var totalPriceUsers;
  DetailsData detailsData = DetailsData(Get.find());
  List<QuantityModle> details = [];
  List<cardnummodle> cardnum = [];
  List<CartModle> CartView = [];
  int countcard = 0;

  int? servicesId;
  int basket = 0;
  changecard() {
    basket = basket == 1 ? 0 : 1;

    update();
  }

  // double totalPrice = 0.0;
  view(String i) async {
    update();
    var response = await detailsData.show(
      myserivce.sharedPreferences.getString("token").toString(),
      i,
    );
    print("=============================== Contraoller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        details.addAll(data.map((e) => QuantityModle.fromJson(e)));
        isProcessing = List.generate(details.length, (_) => false);

        countcard = int.parse(response['count'].toString());
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    countcard = 0;
    // details.clear();
  }

  int? discountcoupon = 0;

  refreshPage() {
    resetVarCart();
    view(menuDetailModel!.menuDetailsId.toString());
  }

  getTotalPrice() {
    return (countcard - countcard * discountcoupon! / 100);
  }

  gotoCard() {
    Get.toNamed(Approute.Detail);
  }

  addCart(String detailid) async {
    String? token = myserivce.sharedPreferences.getString("token");

    if (token == null || token.isEmpty) {
      Get.offAllNamed(Approute.Login);

      Get.snackbar(
        "تنبيه",
        "يرجى تسجيل الدخول أولاً",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );

      return;
    }
    update();
    // بيانات المنتج الذي سيتم إضافته إلى السلة
    Map data = {
      "carts_menu_details": menuDetailModel!.menuDetailsId.toString(),
      "carts_quantitys": detailid.toString(),
      "carts_status": "0",
    };

    // إرسال البيانات إلى الخادم لحفظ السلة
    var response = await detailsData.save(
      myserivce.sharedPreferences.getString("token").toString(),
      data,
    );

    // print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  removeCart(String cardid) async {
    update();

    var response = await detailsData.Remove(
      myserivce.sharedPreferences.getString("token").toString(),
      cardid,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  intialData() async {
    bool isConnected = await checkInternetWithDialog(intialData);

    if (!isConnected) {
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    if (menuDetailModel != null) {
      await view(menuDetailModel!.menuDetailsId.toString());
    }

    statusRequest = StatusRequest.success;
    update();
  }

  List<bool> isProcessing = [];

  add(int index, int detailid) async {
    String? token = myserivce.sharedPreferences.getString("token");
    bool isConnected = await chekInternet();

    if (token == null || token.isEmpty) {
      Get.offAllNamed(Approute.Login);
      Get.snackbar("تنبيه", "يرجى تسجيل الدخول أولاً");
      return;
    }

    if (!isConnected) {
      Get.snackbar("خطأ", "لا يوجد اتصال بالإنترنت");
      return;
    }

    if (isProcessing[index]) return;

    // ✅ تحديث مباشر للكمية على الواجهة
    isProcessing[index] = true;
    details[index].addedQuantity = (details[index].addedQuantity ?? 0) + 1;

    update();

    try {
      await addCart(detailid.toString());
    } catch (e) {
      // في حال فشل الإضافة، رجّع الكمية
      details[index].addedQuantity = (details[index].addedQuantity ?? 1) - 1;
      Get.snackbar("خطأ", "حدث خطأ أثناء الإضافة");
    }

    isProcessing[index] = false;
    update();
  }

  remove(int index, int cardid) async {
    String? token = myserivce.sharedPreferences.getString("token");
    bool isConnected = await chekInternet();

    if (token == null || token.isEmpty) {
      Get.offAllNamed(Approute.Login);
      Get.snackbar("تنبيه", "يرجى تسجيل الدخول أولاً");
      return;
    }

    if (!isConnected) {
      Get.snackbar("خطأ", "لا يوجد اتصال بالإنترنت");
      return;
    }

    if (isProcessing[index]) return;

    int current = details[index].addedQuantity ?? 0;
    if (current > 0) {
      isProcessing[index] = true;
      details[index].addedQuantity = current - 1;
      update();

      try {
        await removeCart(cardid.toString());
      } catch (e) {
        // رجّع الكمية لو صار خطأ
        details[index].addedQuantity = current;
        Get.snackbar("خطأ", "حدث خطأ أثناء الحذف");
      }

      isProcessing[index] = false;
      update();
    } else {
      Get.snackbar("تنبيه", "لا يمكن تقليل الكمية أكثر من صفر");
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['listDetaismodel'] != null) {
      menuDetailModel = Get.arguments['listDetaismodel'];
    } else {
      // تعامَل مع حالة غياب البيانات كما تريد
      print("خطأ: لم يتم تمرير listDetaismodel في arguments");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }
    intialData();
    super.onInit();
  }
}
