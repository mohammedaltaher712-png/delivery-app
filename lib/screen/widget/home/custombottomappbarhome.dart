import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/homescreen_controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Appcolors.orange, width: 2)),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child:  Row(
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return CustomButtonAppBar(
                    textbutton: controller.bottomappbar[index]['title'],
                    icondata: controller.bottomappbar[index]['icon'],
                    onPressed: () {
                      print("object");
                      controller.changePage(index);
                    },
                    active: controller.currentpage == index ? true : false,
                  );
                })),
              ],
            ),
      ),
    );
  }
}
