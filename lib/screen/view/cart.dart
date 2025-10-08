import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/CartController.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/Cart/custombottombar.dart';
import 'package:order_delivery_application/screen/widget/Cart/customlistview.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Cartcontroller());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomTitleAppBar(title: "سلة الطلبات"),

      bottomNavigationBar: GetBuilder<Cartcontroller>(
        builder:
            (controller) => Custombottombarcart(
              onTap: () {
                controller.goToPageCheckout(controller.serivecsModel);
              },
              title1: "${controller.countcard}",
              title2: "ريال ${controller.totalPrice}",
            ),
      ),
      body: Customlistviewcart(),
    );
  }
}
