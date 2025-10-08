import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/Detail_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/Details/customcardcategory.dart';
import 'package:order_delivery_application/screen/widget/Details/customcardhead.dart';
import 'package:order_delivery_application/screen/widget/Details/customcardstats.dart';
import 'package:order_delivery_application/screen/widget/Details/customcart.dart';
import 'package:order_delivery_application/screen/widget/customcardsetail.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailController());
    return GetBuilder<DetailController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: CustomTitleAppBar(title: "القائمة"),

          body: RefreshIndicator(
            onRefresh: () {
              return controller.intialData();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ListView(
                children: [
                  Customcardhead(
                    title1: controller.serivecsModel!.itemsName ?? "",
                    title2: controller.serivecsModel!.servicesDescription ?? "",
                    iconstime: Icons.access_time,
                    title3: "أوقات الدوام",
                    iconsstar: Icons.star,
                    title4: "4.5",
                    URLImages:
                        '${Linkapi.Servicesicons}/${controller.serivecsModel!.servicesIcon}',
                  ),

                  Customcardstats(
                    title1: "الحالة",
                    satsus: controller.serivecsModel!.servicesStatus!,
                    title2: controller.serivecsModel!.servicesStatus.toString(),
                    title3: "وقت التحضير",
                    title4: "30 - 45 دقيقة",
                  ),
                  controller.CartView.isNotEmpty
                      ? Customcart(
                        onTap1:
                            () => controller.gotipagecart(
                              controller.serivecsModel,
                            ),
                        title1: "${controller.countcard}",
                        title2: "${controller.totalPrice}",
                        onTap2:
                            () => controller.gotipagecart(
                              controller.serivecsModel,
                            ),
                      )
                      : Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100, // خلفية فاتحة حمراء
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel,
                              color: Colors.red.shade700,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "السلة فارغة",
                              style: TextStyle(
                                color: Colors.red.shade700,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                  Customcardcategory(),
                  Customcardsetail(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
