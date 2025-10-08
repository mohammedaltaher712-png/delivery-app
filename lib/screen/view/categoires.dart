import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/categoires_controller.dart';
import 'package:order_delivery_application/controller/favorite_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';
import 'package:order_delivery_application/screen/widget/Category/Customcard.dart';
import 'package:order_delivery_application/screen/widget/custombanner.dart';
import 'package:order_delivery_application/screen/widget/custompointbanner.dart';
import 'package:order_delivery_application/screen/widget/customsearch.dart';
import 'package:order_delivery_application/screen/widget/Category/custom.dart';
import 'package:order_delivery_application/screen/widget/Category/customitem.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';

class Categoires extends StatelessWidget {
  const Categoires({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoiresController());
    Get.put(FavoriteController());

    return Scaffold(
      appBar: CustomTitleAppBar(title: "القسم"),

      body: GetBuilder<CategoiresController>(
        builder:
            (controller) => RefreshIndicator(
              onRefresh: () {
                return controller.intialData();
              },
              child: HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      SizedBox(height: 10),

                      GetBuilder<CategoiresController>(
                        builder:
                            (controller) => Column(
                              children: [
                                CarouselSlider(
                                  items:
                                      controller.categ.map((model) {
                                        return Custombanner(
                                          urlimage:
                                              '${Linkapi.bannercategoryimage}/${model.bannerCategorysImage}',
                                        );
                                      }).toList(),
                                  options: CarouselOptions(
                                    height: 200,
                                    viewportFraction: 1.0,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      controller.chage(index);
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    controller.categ.length,
                                    (index) => CustomPointBanner(
                                      isActive:
                                          controller.currentIndex == index,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                      const SizedBox(height: 12),

                      Customitem(),
                      // Container(
                      //   margin: EdgeInsets.symmetric(vertical: 10),
                      //   child: Row(
                      //     children: [
                      //       Custom(title: "التوصيل المجاني"),
                      //       SizedBox(width: 10),
                      //       Custom(title: "الأعلى تقييماً"),
                      //       SizedBox(width: 10),

                      //       Custom(title: "المفضلة"),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 12),

                      Customcard(),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
