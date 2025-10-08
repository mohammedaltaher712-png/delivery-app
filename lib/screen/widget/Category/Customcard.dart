import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/categoires_controller.dart';
import 'package:order_delivery_application/controller/favorite_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/functions/ordersdetilsdelivery.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';

class Customcard extends StatelessWidget {
  const Customcard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoiresController>(
      builder:
          (controller) =>
              controller.statusRequestServices == StatusRequest.success
                  ? SizedBox(
                    height: Get.height / 2,
                    child: ListView.builder(
                      itemCount: controller.itemslistserivecs.length,
                      itemBuilder: (context, index) {
                        controller.isFavorite[controller
                                .itemslistserivecs[index]
                                .servicesId] =
                            controller.itemslistserivecs[index].favorite;
                        return HandlingDataView(
                          statusRequest: controller.statusRequestServices,
                          widget: card(
                            i: index,
                            serivecsModel: controller.itemslistserivecs[index],
                          ),
                        );
                      },
                    ),
                  )
                  : Center(
                    child: CircularProgressIndicator(color: Appcolors.orange),
                  ),
    );
  }
}

class card extends GetView<CategoiresController> {
  const card({super.key, required this.i, required this.serivecsModel});
  final int? i;
  final SerivecsModel serivecsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotipage(serivecsModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Appcolors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Linkapi.Servicesimage}/${serivecsModel.servicesImage}",
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Text(
                        "${serivecsModel.servicesName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${serivecsModel.servicesDescription}",
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star, color: Appcolors.orange, size: 18),
                          SizedBox(width: 4),
                          // Text(
                          //   "${menuModel.itemsRating}",
                          //   style: TextStyle(fontSize: 14),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: Get.width / 3.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "45-30 دقيقة",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Icon(Icons.timer, color: Colors.red, size: 18),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 8,
              child: GetBuilder<CategoiresController>(
                builder:
                    (controller) => InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        if (controller.isFavorite[serivecsModel.servicesId] ==
                            1) {
                          controller.setFavorite(serivecsModel.servicesId, 0);
                          controller.removeFavorite(
                            serivecsModel.servicesId.toString(),
                          );
                          controller.ref();
                        } else {
                          controller.setFavorite(serivecsModel.servicesId, 1);
                          controller.addFavorite(
                            serivecsModel.servicesId.toString(),
                          );
                          controller.ref();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white, // خلفية برتقالية شفافة
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          controller.isFavorite[serivecsModel.servicesId] == 1
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Appcolors.orange,
                          size: 22,
                        ),
                      ),
                    ),
              ),
            ),

            Positioned(
              bottom: 50,
              right: 20,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: Appcolors.orange),
                    ),
                    height: 100,
                    width: Get.width / 4,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${Linkapi.Servicesicons}/${serivecsModel.servicesIcon}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color:
                            serivecsModel.servicesStatus == 1
                                ? Colors.green
                                : Colors.red,

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        printstatus(serivecsModel.servicesStatus.toString()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
