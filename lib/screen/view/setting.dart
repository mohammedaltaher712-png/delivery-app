import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/settings_controller.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';
import 'package:order_delivery_application/screen/widget/setting/Customsetingcard.dart';
import 'package:order_delivery_application/screen/widget/setting/Customsetingtitlecard.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomTitleAppBar(title: "الإعدادات"),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            SizedBox(height: 20),

            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Appimages.avatar),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.myServices.sharedPreferences.getString(
                            "email",
                          ) ??
                          "لا يوجد بريد",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '${controller.myServices.sharedPreferences.getInt("phone") ?? 0}', // 0 كقيمة افتراضية
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30),

            // قسم عام
            Customsetingtitlecard(title: "عام"),

            Customsetingcard(
              onTap: () {
                Get.toNamed(Approute.Address);
              },
              icon: Icons.location_on,
              title: ' الموقع خدمتك',
              subtitle: '  أضافة',
            ),
            Customsetingcard(
              onTap: () {
                Get.toNamed(Approute.OrderHistory);
              },
              icon: Icons.update,
              title: ' سجل الطلبات',
              subtitle: "الارشيف",
            ),
            // Customsetingcard(
            //   icon: Icons.card_travel,
            //   title: ' الارشيف',
            //   subtitle: "",
            // ),
            Customsetingcard(
              onTap: () {
                controller.logout();
              },
              icon: Icons.logout,
              title: 'تسجيل الخروج',
              subtitle: "",
            ),
            SizedBox(height: 20),
            Customsetingtitlecard(title: "تواصل"),

            Customsetingcard(
              onTap: () {
                launchUrl(Uri.parse("tel:775199964"));
              },
              icon: Icons.phone,
              title: 'تواصل معانا',
              subtitle: "",
            ),
          ],
        ),
      ),
    );
  }
}
