import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';

class Welcomecontroller extends GetxController {
  Future<void> Welcome() async {
    await Future.delayed(Duration(seconds: 3));

    bool isConnected = await chekInternet();

    if (!isConnected) {
      Get.defaultDialog(
        title: "خطأ",
        titleStyle: TextStyle(color: Appcolors.orange),
        middleText: "لا يمكن الوصول إلى السيرفر. تأكد من الاتصال بالإنترنت.",
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
            Welcome();
          },
          child: Text("إعادة المحاولة"),
        ),
      );
    } else {
      Get.offNamed(Approute.HomeScreen);
    }
  }

  @override
  void onInit() {
    Welcome();
    super.onInit();
  }
}
