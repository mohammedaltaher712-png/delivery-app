import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/Detail_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/list_detaismodel.dart';

class Customcardsetail extends StatelessWidget {
  const Customcardsetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder:
          (controller) =>
              controller.statusRequest == StatusRequest.success
                  ? SizedBox(
                    height: Get.height / 2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.list_detai_menus.length,
                      itemBuilder: (context, index) {
                        return cards(
                          menuDetailModel: controller.list_detai_menus[index],
                          i: index,
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

class cards extends GetView<DetailController> {
  const cards({super.key, required this.i, required this.menuDetailModel});
  final int? i;
  final MenuDetailModel menuDetailModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotipage(menuDetailModel);
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة
              Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: Hero(
                      tag: menuDetailModel.menuDetailsId!,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Linkapi.menudetailsimage}/${menuDetailModel.menuDetailsImage}",
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.gotipage(menuDetailModel);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 18,
                          color: Appcolors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              // التفاصيل النصية
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${menuDetailModel.menuDetailsName}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // الوصف
                    Text(
                      "${menuDetailModel.menuDetailsDescription}",
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 10),

                    // السعر
                    Text(
                      "${menuDetailModel.menuDetailsPrice} ريال",
                      style: TextStyle(
                        fontSize: 15,
                        color: Appcolors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
