import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppThemes.dart';
import 'package:order_delivery_application/core/functions/fcmconfig.dart';
import 'package:order_delivery_application/core/services/service.dart';

class LocaleConrtoller extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appthemes = ThemeArabic;
  changeLang(String langocde) {
    Locale locale = Locale(langocde);
    myServices.sharedPreferences.setString("lang", langocde);
    // appthemes = langocde == "ar" ? ThemeArabic : themeEnglish;
    Get.changeTheme(appthemes);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    requestPerLocation();
    String? sharedPreferencesLang = myServices.sharedPreferences.getString(
      "lang",
    );

    if (sharedPreferencesLang == "ar") {
      language = const Locale("ar");
      appthemes = ThemeArabic;
    } else if (sharedPreferencesLang == "en") {
      language = const Locale("en");
      // appthemes = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      // appthemes = themeEnglish;
    }

    super.onInit();
  }
}
