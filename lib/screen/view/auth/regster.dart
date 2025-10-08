import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/auth/regster_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/alertExitApp.dart';
import 'package:order_delivery_application/core/functions/validinput.dart';
import 'package:order_delivery_application/screen/widget/auth/custombuttomauth.dart';
import 'package:order_delivery_application/screen/widget/auth/customtextbowm.dart';
import 'package:order_delivery_application/screen/widget/auth/customtextfromfield.dart';
import 'package:order_delivery_application/screen/widget/auth/customtitleauth.dart';

class Regster extends StatelessWidget {
  const Regster({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegsterController());

    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<RegsterController>(
          builder:
              (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                      children: [
                        Image.asset(
                          Appimages.logo,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                        Customtitleauth(
                          titleone: "انشاءحساب ",
                          titletow: "مرحباً بعودتك 👋",
                        ),
                        const SizedBox(height: 10),
                        Customtextfromfield(
                          isNumber: false,

                          validator: (val) {
                            return validInput(val!, 5, 50, "name");
                          },
                          icondata: Icon(Icons.person_2),
                          labe: "الاسم ",
                          text: "أدخل الاسم ",
                          controller: controller.name,
                        ),
                        const SizedBox(height: 20),
                        Customtextfromfield(
                          isNumber: false,

                          validator: (val) {
                            return validInput(val!, 10, 50, "email");
                          },
                          icondata: Icon(Icons.email),
                          labe: "البريد الإلكتروني",
                          text: "أدخل بريدك الإلكتروني",
                          controller: controller.email,
                        ),
                        const SizedBox(height: 20),
                        Customtextfromfield(
                          isNumber: true,
                          validator: (val) {
                            return validInput(val!, 9, 9, "phone");
                          },
                          icondata: Icon(Icons.phone),
                          labe: " رقم الهاتف",
                          text: "أدخل رقم الهاتف",
                          controller: controller.phone,
                        ),
                        const SizedBox(height: 20),

                        GetBuilder<RegsterController>(
                          builder:
                              (controller) => Customtextfromfield(
                                isNumber: false,

                                Iconspassword: Icons.lock,
                                obscureText: controller.ispassword,
                                onTap: () {
                                  controller.chagepassword();
                                },
                                validator: (val) {
                                  return validInput(val!, 8, 50, "password");
                                },
                                icondata: Icon(Icons.password),
                                labe: "كلمة المرور",
                                text: "••••••••",
                                controller: controller.password,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Custombuttomauth(
                          title: "انشاء حساب",
                          onPressed: () {
                            controller.regs();
                          },
                        ),
                        const SizedBox(height: 20),
                        Customtextbowm(
                          title: " لديك حساب؟ ",
                          title1: "تسجيل  الدخول",
                          onTap: () {
                            Get.offAllNamed(Approute.Login);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
