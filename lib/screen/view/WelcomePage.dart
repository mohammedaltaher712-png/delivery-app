import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/WelcomeController.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Welcomecontroller());

    // عرض البوتوم شيت بعد بناء الصفحة
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   // لو عايز تشغل الدالة Welcome قبل العرض
    //   bool success = await controller.Welcome();

    //   if (success) {
    //     showBottomSheet(context, controller);
    //   }

    //   // شرط مستقل لعرض bottom sheet بناءً على argument بدون انتظار Welcome
    //   if (Get.arguments != null && Get.arguments['showSheet'] == true) {
    //     showBottomSheet(context, controller);
    //   }
    // });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              curve: Curves.bounceOut,
              duration: Duration(seconds: 2),
              child: SizedBox(
                width: Get.width * 0.6,
                height: Get.width * 0.5,
                child: Image.asset(Appimages.logo, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
             BounceInUp(
              from: 30, 
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 2), 
              child: Text(
                "أفضل تجربة طلبات",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
