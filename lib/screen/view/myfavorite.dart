import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/favorite_controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';
import 'package:order_delivery_application/screen/widget/favorites/customlsitviewfavorite.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomTitleAppBar(title: "مفصلتي"),

      body: Customlsitviewfavorite(),
    );
  }
}
