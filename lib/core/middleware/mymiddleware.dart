// ignore: implementation_imports

import 'package:flutter/src/widgets/navigator.dart';

import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/services/service.dart';



class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    MyServices myserivce = Get.find();
    if (myserivce.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: Approute.HomeScreen);
    }
    if (myserivce.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: Approute.Login);
    }

    return null;
  }
}
