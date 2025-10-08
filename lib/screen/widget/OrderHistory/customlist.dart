import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/OrderHistory_Controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/ordersdetilsdelivery.dart';
import 'package:order_delivery_application/data/model/ordersmodle.dart';
import 'package:order_delivery_application/screen/widget/OrderHistory/customtext.dart';

class Customlist extends StatelessWidget {
  const Customlist({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderhistoryController>(
      builder:
          (controller) => RefreshIndicator(
            onRefresh: () {
              return controller.view();
            },
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.ordershow.length,
                itemBuilder: (context, index) {
                  return cardlist(
                    ordersModle: controller.ordershow[index],
                    i: index,
                  );
                },
              ),
            ),
          ),
    );
  }
}

class cardlist extends StatelessWidget {
  const cardlist({super.key, required this.ordersModle, this.i});
  final OrdersModle ordersModle;
  final int? i;
  @override
  Widget build(BuildContext context) {
    const mainColor = Appcolors.orange;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان والصورة
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Linkapi.Servicesicons}/${ordersModle.servicesIcon}",
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            const CircularProgressIndicator(strokeWidth: 2),
                    errorWidget:
                        (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "رقم الطلب : #${ordersModle.ordersId}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 18,
                            color: mainColor,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              timeAgo(ordersModle.createdAt!),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.date_range,
                            size: 18,
                            color: mainColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            ordersModle.createdAt?.substring(0, 10) ?? '',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(height: 25),

            // تفاصيل الطلب
            Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                CustomText(
                  icon: Icons.attach_money,
                  text: "سعر الطلب : ${ordersModle.ordersPrice} ريال",
                ),
                CustomText(
                  icon: Icons.delivery_dining,
                  text: "سعر التوصيل : ${ordersModle.ordersPricedelivery} ريال",
                ),
                CustomText(
                  icon: Icons.payment,
                  text: "طريقة الدفع : ${ordersModle.paymentsName}",
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomText(
                    icon: Icons.info_outline,
                    text:
                        "حالة الطلب : ${printOrderStatus(ordersModle.ordersStatus.toString())}",

                    highlight: true,
                  ),
                ),
              ],
            ),

            const Divider(height: 25),

            // الإجمالي + زر التفاصيل
            Row(
              children: [
                Text(
                  "الإجمالي : ${ordersModle.ordersPrice} ريال",
                  style: const TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      Approute.Orderhistorydetails,
                      arguments: {"ordersModle": ordersModle},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "تفاصيل",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
