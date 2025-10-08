import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/services/service.dart';


class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    // String id = myServices.sharedPreferences.getString("id")!;
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Approute.Login);
  }
    bool isDarkMode = false;

  void toggleTheme(bool value) {
    isDarkMode = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    update();  // يُخبر الـ GetBuilder بإعادة بناء الواجهة
  }
}
