import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/auth/login_data.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  MyServices myserivce = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  bool ispassword = true;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.login(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          myserivce.sharedPreferences.setString(
            "token",
            response['count'], // 👈 هذا هو الصحيح
          );

          myserivce.sharedPreferences.setInt(
            "id",
            response['data']['users_id'],
          );
          int UserId = myserivce.sharedPreferences.getInt("id")!;

          myserivce.sharedPreferences.setString(
            "name",
            response['data']['users_name'],
          );
          myserivce.sharedPreferences.setString(
            "email",
            response['data']['users_email'],
          );
          myserivce.sharedPreferences.setInt(
            "phone",
            response['data']['users_phone'],
          );
          myserivce.sharedPreferences.setString(
            "step",
            "2", // 👈 هذا هو الصحيح
          );
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users$UserId");
          Get.offNamed(Approute.HomeScreen);
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
        // End
      } else {
        statusRequest = StatusRequest.failure;
        update();
        Get.defaultDialog(
          title: "تحذير",
          middleText: "كلمه السر أو البريد الإلكتروني غير موجود ",
        );
      }
    }
    update();
  }

  chagepassword() {
    ispassword = ispassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
}
