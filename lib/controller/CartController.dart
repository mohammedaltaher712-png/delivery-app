import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/Detail_controller.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/details_data.dart';
import 'package:order_delivery_application/data/model/cardpricemodle.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';

class Cartcontroller extends GetxController {
  double totalPrice = 0.0;
  int countcard = 0;
  DetailsData detailsData = DetailsData(Get.find());
  List<CartModle> CartView = [];
  @override
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myserivce = Get.find();
  DetailController DeController = Get.find();
  SerivecsModel? serivecsModel;

  add(int detailid, int menuDetailsId) async {
    String? token = myserivce.sharedPreferences.getString("token");
    bool isConnected = await chekInternet();

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
    } else if (!isConnected) {
      Get.defaultDialog(
        title: "خطأ",
        titleStyle: TextStyle(color: Appcolors.orange),
        middleText: "لا يمكن الوصول إلى السيرفر. تأكد من الاتصال بالإنترنت.",
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("إعادة المحاولة"),
        ),
      );
      return;
    }

    // تحديث الواجهة قبل إضافة العنصر
    update();

    // إضافة العنصر إلى السلة
    addCart(detailid.toString(), menuDetailsId.toString())
        .then((_) async {
          // بعد الإضافة، تحديث السلة بسرعة
          await Future.delayed(
            Duration(milliseconds: 100),
          ); // تأخير بسيط لتحديث الشبكة
          viewCard(); // تحديث السعر والعدد بدون انتظار استجابة المستخدم
          update();
        })
        .catchError((e) {
          update();
          Get.snackbar("خطأ", "حدث خطأ أثناء الإضافة");
        });
  }

  addCart(String detailid, String menuDetailsId) async {
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
      "carts_menu_details": menuDetailsId.toString(),
      "carts_quantitys": detailid.toString(),
      "carts_status": "0",
    };

    // إرسال البيانات إلى الخادم لحفظ السلة
    var response = await detailsData.save(
      myserivce.sharedPreferences.getString("token").toString(),
      data,
    );

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        viewCard();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  remove(int cardid) async {
    String? token = myserivce.sharedPreferences.getString("token");
    bool isConnected = await chekInternet();

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
    } else if (!isConnected) {
      Get.defaultDialog(
        title: "خطأ",
        titleStyle: TextStyle(color: Appcolors.orange),
        middleText: "لا يمكن الوصول إلى السيرفر. تأكد من الاتصال بالإنترنت.",
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("إعادة المحاولة"),
        ),
      );
      return;
    }
    removeCart(cardid.toString())
        .then((_) async {
          await Future.delayed(Duration(milliseconds: 100));
          viewCard(); // تحديث السعر بدون انتظار المستخدم

          update();
        })
        .catchError((e) {
          update();
          Get.snackbar("خطأ", "حدث خطأ أثناء الحذف");
        });
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
        viewCard();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  removeCartAll(String cardid) async {
    update();

    var response = await detailsData.RemoveAll(
      myserivce.sharedPreferences.getString("token").toString(),
      cardid,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        viewCard();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  viewCard() async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await detailsData.viewprice(
      myserivce.sharedPreferences.getString("token").toString(),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        CartView.clear();

        List data = response['data'];
        CartView.addAll(data.map((e) => CartModle.fromJson(e)));
        totalPrice = response['count'].toDouble();
        countcard = int.parse(response['tot'].toString());
        DeController.viewCard();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCheckout(serivecsModel) {
    if (CartView.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(
      Approute.Invoicepage,
      arguments: {"CartView": CartView, "totalPrice": totalPrice,"serivecsModel":serivecsModel},
    );
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['serivecsModel'] != null) {
      serivecsModel = Get.arguments['serivecsModel'];
    } else {
      // تعامَل مع حالة غياب البيانات كما تريد
      print("خطأ: لم يتم تمرير serivecsModel في arguments");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }
    viewCard();

    super.onInit();
  }
}
