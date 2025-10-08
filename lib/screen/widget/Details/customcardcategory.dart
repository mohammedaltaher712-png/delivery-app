import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/Detail_controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/menumodel.dart';

class Customcardcategory extends StatelessWidget {
  const Customcardcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder:
          (controller) => Container(
            height: 55,
            margin: EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.menuserivces.length,
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return category(
                  menumodle: controller.menuserivces[index],
                  i: index,
                );
              },
            ),
          ),
    );
  }
}

class category extends GetView<DetailController> {
  const category({super.key, required this.menumodle, this.i});
  final MenuModel menumodle;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => controller.changeSerivceitms(i, menumodle.menusId.toString()),
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color:
              controller.selectedCat == i
                  ? Appcolors.orange
                  : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow:
              controller.selectedCat == i
                  ? [
                    BoxShadow(
                      color: Appcolors.orange.withOpacity(0.4),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: Center(
          child: Text(
            "${menumodle.menusName}",
            style: TextStyle(
              color:
                  controller.selectedCat == i ? Colors.white : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
