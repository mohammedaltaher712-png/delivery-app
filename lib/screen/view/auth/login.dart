import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/auth/login_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/alertExitApp.dart';
import 'package:order_delivery_application/core/functions/validinput.dart';
import 'package:order_delivery_application/screen/widget/auth/custombuttomauth.dart';
import 'package:order_delivery_application/screen/widget/auth/customtextbowm.dart';
import 'package:order_delivery_application/screen/widget/auth/customtextfromfield.dart';
import 'package:order_delivery_application/screen/widget/auth/customtitleauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginController>(
          builder:
              (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formstate,
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      children: [
                        Image.asset(
                          Appimages.logo,
                          width: 100,
                          height: 200,
                          fit: BoxFit.fitHeight,
                        ),
                        Customtitleauth(
                          titleone: "تسجيل الدخول",
                          titletow: "مرحباً بعودتك 👋",
                        ),
                        const SizedBox(height: 10),
                        Customtextfromfield(
                          isNumber: false,

                          icondata: Icon(Icons.email),
                          validator: (val) {
                            return validInput(val!, 10, 50, "email");
                          },
                          labe: "البريد الإلكتروني",
                          text: "أدخل بريدك الإلكتروني",
                          controller: controller.email,
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<LoginController>(
                          builder:
                              (controller) => Customtextfromfield(
                                isNumber: false,

                                obscureText: controller.ispassword,
                                onTap: () {
                                  controller.chagepassword();
                                },
                                Iconspassword: Icons.lock,
                                icondata: Icon(Icons.password),
                                validator: (val) {
                                  return validInput(val!, 8, 50, "password");
                                },
                                labe: "كلمة المرور",
                                text: "••••••••",
                                controller: controller.password,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(ForgetPasswordPage());
                            },
                            child: Text(
                              "هل نسيت كلمة السر؟",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.orange,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Custombuttomauth(
                          title: "تسجيل الدخول",
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(height: 30),
                        Customtextbowm(
                          title: "ليس لديك حساب؟ ",
                          title1: "إنشاء حساب",
                          onTap: () {
                            Get.offNamed(Approute.Regster);
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
