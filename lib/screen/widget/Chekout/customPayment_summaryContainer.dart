import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class CustomPaymentSummaryContainer extends StatelessWidget {
  const CustomPaymentSummaryContainer({
    super.key,
    required this.title,
    required this.cartItems,
    required this.deliveryPrice,
    required this.totalWithDelivery,
    required this.discountCoupon,
    required this.statusCoupon,
    required this.deliveryLabel,
    required this.totalLabel,
  });

  final String title;
  final List<dynamic> cartItems;
  final double? deliveryPrice;
  final double? totalWithDelivery;
  final int discountCoupon;
  final int statusCoupon;
  final String deliveryLabel;
  final String totalLabel;

  @override
  Widget build(BuildContext context) {
    final listHeight = cartItems.length * 50.0;

    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Appcolors.orange, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔶 العنوان
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Appcolors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.receipt_long,
                    color: Appcolors.Lsitca,
                    size: 28,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Appcolors.black,
                  ),
                ),
              ],
            ),

            Divider(color: Appcolors.orange, thickness: 1.5, height: 28),

            /// 🔶 قائمة المنتجات
            SizedBox(
              height: listHeight > 300 ? 250 : listHeight,
              child: ListView.separated(
                physics:
                    listHeight > 250
                        ? AlwaysScrollableScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Appcolors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.menuDetailsName ?? '',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Appcolors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${item.totalPrice} ريال",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.orange,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 8),

            /// 🔶 عرض الخصم
            if (statusCoupon != 0)
              Text(
                "(خصم $discountCoupon%)",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.orange,
                ),
              ),

            SizedBox(height: 8),

            /// 🔶 سعر التوصيل
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  deliveryLabel,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Appcolors.black,
                  ),
                ),

                Text(
                  deliveryPrice == null
                      ? " قم باختيار عنوان التوصيل أولاً"
                      : "${deliveryPrice!.toStringAsFixed(0)} ريال",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Appcolors.orange,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),

            /// 🔶 الإجمالي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  totalLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Appcolors.black,
                  ),
                ),
                Text(
                  deliveryPrice == null
                      ? " قم باختيار عنوان التوصيل أولاً"
                      : "${totalWithDelivery!.toStringAsFixed(0)} ريال",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.orange,
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
