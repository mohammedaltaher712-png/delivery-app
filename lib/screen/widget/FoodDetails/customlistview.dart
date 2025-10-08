import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/FooddetilesController.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/Detailsmodle.dart';

class Customlistview extends StatelessWidget {
  const Customlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Fooddetilescontroller>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Column(
              children: List.generate(
                controller.details.length,
                (index) => cardview(
                  quantityModle: controller.details[index],
                  i: index,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class cardview extends GetView<Fooddetilescontroller> {
  const cardview({super.key, required this.quantityModle, this.i});
  final QuantityModle quantityModle;
  final int? i;
  @override
  Widget build(BuildContext context) {
    Get.put(Fooddetilescontroller());

    return GetBuilder<Fooddetilescontroller>(
      builder:
          (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: Get.width / 1.2,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      "${quantityModle.addedQuantity} عنصر مضاف من هذا الصنف إلى السلة",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${quantityModle.quantitysName}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${quantityModle.quantitysPrice}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // زر زيادة
                          IconButton(
                            onPressed: () async {
                              await controller.add(
                                i!,
                                controller.details[i!].quantitysId!,
                              );
                              controller.refreshPage();
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Appcolors.orange,
                              size: 28,
                            ),
                          ),
                          // العدد أو أيقونة السلة
                          GetBuilder<Fooddetilescontroller>(
                            builder: (controller) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Appcolors.orange,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  "${quantityModle.addedQuantity}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),

                          // زر إنقاص
                          IconButton(
                            onPressed: () async {
                              await controller.remove(
                                i!,
                                controller.details[i!].quantitysId!,
                              );
                              controller.refreshPage();
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: Appcolors.orange,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
