import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/homebanner_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';
import 'package:order_delivery_application/screen/widget/Category/Customcard.dart';
import 'package:order_delivery_application/screen/widget/Customcardsearch.dart';
import 'package:order_delivery_application/screen/widget/custombanner.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';
import 'package:order_delivery_application/screen/widget/home/customcategorylist.dart';
import 'package:order_delivery_application/screen/widget/custompointbanner.dart';
import 'package:order_delivery_application/screen/widget/customsearch.dart';
import 'package:order_delivery_application/screen/widget/home/customtitleappbar.dart';
import 'package:order_delivery_application/screen/widget/home/customtitlestatus.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomebannerController controller = Get.put(HomebannerController());
    return Scaffold(
      appBar: CustomTitleAppBar(title: "الرئيسية"),
      // bottomNavigationBar: Custombottomappbar(),
      body: GetBuilder<HomebannerController>(
        builder:
            (controller) => RefreshIndicator(
              onRefresh: () async {
                await controller.refreshPage();
              },
              child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Customsearch(
                        title: "البحث...",
                        controller: controller.search,
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                      ),
                      !controller.isSearch
                          ? Column(
                            children: [
                              GetBuilder<HomebannerController>(
                                builder:
                                    (controller) => Column(
                                      children: [
                                        CarouselSlider(
                                          items:
                                              controller.banner.map((model) {
                                                return Custombanner(
                                                  urlimage:
                                                      '${Linkapi.homebannersimage}/${model.bannerHomesImage}',
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            controller.banner.length,
                                            (index) => CustomPointBanner(
                                              isActive:
                                                  controller.currentIndex ==
                                                  index,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              ),

                              SizedBox(height: 10),
                              // Customtitlestatus(
                              //   title: "مفتوح",
                              //   title1: "نستقبل طلباتكم من 8:00 صباحا الي\n 10:00 مساء",
                              // ),
                              SizedBox(height: 20),
                              Customcategorylist(),
                            ],
                          )
                          : ListItemsSearch(Serivcesmodle: controller.listdata),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
