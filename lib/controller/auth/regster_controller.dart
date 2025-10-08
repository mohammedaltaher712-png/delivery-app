import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/data/auth/regster_data.dart';

class RegsterController extends GetxController {
  late TextEditingController name;

  late TextEditingController email;
  late TextEditingController phone;

  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
  RegisterData registerData = RegisterData(Get.find());
  bool ispassword = true;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();
  regs() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await registerData.register(
        name.text,
        email.text,
        phone.text,
        password.text,
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(
            Approute.Login,
          ); // انتقل للصفحة التالية فقط في حال النجاح
        } else {
          statusRequest = StatusRequest.failure;
          update();
          Get.defaultDialog(
            title: "تحذير",
            middleText: "رقم الهاتف أو البريد الإلكتروني موجود بالفعل",
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
        Get.defaultDialog(
          title: "تحذير",
          middleText: "رقم الهاتف أو البريد الإلكتروني موجود بالفعل",
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
    name = TextEditingController();

    email = TextEditingController();
    phone = TextEditingController();

    password = TextEditingController();

    super.onInit();
  }
}
