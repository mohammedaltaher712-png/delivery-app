import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/homescreen_controller.dart';
import 'package:order_delivery_application/screen/widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Scaffold(
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: controller.listPage.elementAt(controller.currentpage),
          ),
    );
  }
}
