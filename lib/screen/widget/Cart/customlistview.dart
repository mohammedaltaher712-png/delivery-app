import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/CartController.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/shared/showCustomDialog.dart';
import 'package:order_delivery_application/data/model/cardpricemodle.dart';

class Customlistviewcart extends StatelessWidget {
  const Customlistviewcart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Cartcontroller>(
      builder:
          (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:
                controller.CartView.isEmpty
                    ? Center(
                      child: Text(
                        "السلة فارغة",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : RefreshIndicator(
                      onRefresh: () {
                        return controller.viewCard();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: controller.CartView.length,
                        itemBuilder: (context, index) {
                          return carts(cartModle:controller.CartView[index] ,i: index,);
                        },
                      ),
                    ),
          ),
    );
  }
}

class carts extends GetView<Cartcontroller> {
  const carts({super.key, required this.i, required this.cartModle});
  final int? i;
  final CartModle cartModle;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                    '${Linkapi.menudetailsimage}/${cartModle.menuDetailsImage}',
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
                    cartModle.menuDetailsName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cartModle.menuDetailsDescription ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${cartModle.unitPrice} ريال",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        color: Appcolors.orange,
                        onPressed: () async {
                          await controller.remove(cartModle.quantitysId!);
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolors.orange),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[100],
                        ),
                        child: Text(
                          "${cartModle.quantityCount}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        color: Appcolors.orange,
                        onPressed: () async {
                          await controller.add(
                            cartModle.quantitysId!,
                            cartModle.menuDetailsId!,
                          );
                        },
                      ),
                    ],
                  ),
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
                      middleText: "هل تريد حذف المنتج من السلة؟",

                      onConfirm: () async {
                        await controller.removeCartAll(
                          cartModle.quantitysId.toString(),
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
    );
  }
}
