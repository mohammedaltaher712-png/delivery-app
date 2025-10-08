import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

chekInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
Future<bool> checkInternetWithDialog(Function onRetry) async {
  bool isConnected = await chekInternet(); // افترض عندك هذه الفنكشن

  if (!isConnected) {
    await Get.defaultDialog(
      title: "خطأ",
      titleStyle: TextStyle(color: Appcolors.orange),
      middleText: "لا يمكن الوصول إلى السيرفر. تأكد من الاتصال بالإنترنت.",
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          onRetry();  // إعادة المحاولة هنا
        },
        child: Text("إعادة المحاولة"),
      ),
    );
  }

  return isConnected;
}
