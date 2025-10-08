import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:order_delivery_application/core/binding/mybinding.dart';
import 'package:order_delivery_application/core/localization/changelocal.dart';
import 'package:order_delivery_application/core/localization/translation.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleConrtoller conrtoller = Get.put(LocaleConrtoller());

    return GetMaterialApp(
      initialBinding: Mybinding(),
      translations: MyTranslation(),
      locale: conrtoller.language,
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      theme: conrtoller.appthemes,
    );
  }
}
