import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/FooddetilesController.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/FoodDetails/custombottombar.dart';
import 'package:order_delivery_application/screen/widget/FoodDetails/customimage.dart';
import 'package:order_delivery_application/screen/widget/FoodDetails/customlistview.dart';
import 'package:order_delivery_application/screen/widget/FoodDetails/customtitlelist.dart';
import 'package:order_delivery_application/screen/widget/FoodDetails/customtitlepage.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart'
    show CustomTitleAppBar;

class Fooddetiles extends StatelessWidget {
  const Fooddetiles({super.key});

  @override
  Widget build(BuildContext context) {
    Fooddetilescontroller controller = Get.put(Fooddetilescontroller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomTitleAppBar(title: "تفاصيل المنتج"),

      bottomNavigationBar: GetBuilder<Fooddetilescontroller>(
        builder:
            (controller) => GetBuilder<Fooddetilescontroller>(
              builder:
                  (controller) => Custombottombar(
                    title2: "${controller.getTotalPrice()} ريال", // ✅
                    title3: "المتابعة",
                    icons: Icons.navigate_next_rounded,
                    onPressedcard: () async {
                      await controller.DeController.intialData();
                      await controller.gotoCard();
                    },
                    onTap: () {
                      controller.DeController.intialData();

                      Get.back();
                      print("object");
                    },
                  ),
            ),
      ),
      body: GetBuilder<Fooddetilescontroller>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Customimage(
                    UrlImge:
                        "${Linkapi.menudetailsimage}/${controller.menuDetailModel!.menuDetailsImage}",
                    tag: controller.menuDetailModel!.menuDetailsId!,
                  ),
                  Customtitlepage(
                    title1: controller.menuDetailModel!.menuDetailsName ?? '',
                    title2:
                        controller.menuDetailModel!.menuDetailsDescription ??
                        '',
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Appcolors.orange),
                        ),
                      ),
                      Customtitlelist(
                        icon: Icons.format_list_numbered,
                        title1: "الكمية",
                      ),

                      Customlistview(),
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
