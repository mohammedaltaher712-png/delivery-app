import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/favorite_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/functions/ordersdetilsdelivery.dart';
import 'package:order_delivery_application/core/shared/showCustomDialog.dart';
import 'package:order_delivery_application/data/model/myfavoritesmodle.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';

class Customlsitviewfavorite extends StatelessWidget {
  const Customlsitviewfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder:
          (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:
                controller.favoritesView.isEmpty
                    ? Center(
                      child: Text(
                        "مفضلتي فارغة",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : RefreshIndicator(
                      onRefresh: () {
                        return controller.viewfavorites();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: controller.favoritesView.length,
                        itemBuilder: (context, index) {
                          return cartfavorite(
                            serivecsModel: controller.favoritesView[index],
                            i: index,
                          );
                        },
                      ),
                    ),
          ),
    );
  }
}

class cartfavorite extends GetView<FavoriteController> {
  const cartfavorite({super.key, this.i, required this.serivecsModel});
  final int? i;
  final SerivecsModel serivecsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotipage(serivecsModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl:
                      '${Linkapi.Servicesicons}/${serivecsModel.servicesIcon}',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serivecsModel.servicesName ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      serivecsModel.servicesDescription ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Container(
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
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      showCustomDialog(
                        title: "تنبيه",
                        middleText: "هل تريد حذف المنتج من المفضلة؟",

                        onConfirm: () async {
                          controller.removeFavorite(
                            serivecsModel.servicesId.toString(),
                          );
                          Get.back();
                        },
                        onCancel: () => Get.back(),
                      );
                    },
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
