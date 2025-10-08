import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:order_delivery_application/controller/OrderHistorydetails_Controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';

class Orderhistorydetails extends StatelessWidget {
  const Orderhistorydetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderhistorydetailsController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomTitleAppBar(title: "تفاصيل الطلبات"),
      body: GetBuilder<OrderhistorydetailsController>(
        builder: (controller) {
          final order = controller.ordersModle!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ✅ بطاقة تفاصيل الطلب
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        _buildDetailRow(
                          Icons.confirmation_number,
                          "الرقم",
                          "${order.ordersId}",
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.calendar_today,
                          "التاريخ",
                          order.createdAt?.substring(0, 10) ?? '',
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.access_time,
                          "الوقت",
                          order.createdAt != null
                              ? DateFormat(
                                'hh:mm a',
                              ).format(DateTime.parse(order.createdAt!))
                              : '',
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.payment,
                          "وسيلة الدفع",
                          order.paymentsName ?? '',
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.storefront,
                          "المتجر",
                          order.servicesName ?? '',
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.location_on,
                          "العنوان",
                          order.addressusersName ?? '',
                        ),
                        const Divider(),
                        _buildDetailRow(
                          Icons.note_alt,
                          "الملاحظات",
                          (order.ordersComments?.isNotEmpty ?? false)
                              ? order.ordersComments!
                              : "لا توجد ملاحظات",
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Appcolors.Lsitca,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    "📍 حالة الطلب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Changa",
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),

                order.ordersStatus == 0
                    ? Container(
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
                            "تم إلغاء الطلب",
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                    : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildOrderStatusStep(
                            isActive: order.ordersStatus == 1,
                            number: "1",
                            text: "تحت المراجعة",
                          ),
                          _buildOrderStatusStep(
                            isActive: order.ordersStatus == 2,
                            number: "2",
                            text: "جاري التحضير",
                          ),
                          _buildOrderStatusStep(
                            isActive: order.ordersStatus == 3,
                            number: "3",
                            text: "في الطريق إليك",
                          ),
                          _buildOrderStatusStep(
                            isActive: order.ordersStatus == 4,
                            number: "4",
                            text: "تم التوصيل",
                            isLast: true,
                          ),
                        ],
                      ),
                    ),

                const SizedBox(height: 25),

                // ✅ عنوان المنتجات
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Appcolors.Lsitca,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    "🛒 المنتجات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Changa",
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),

                // ✅ جدول المنتجات
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      _buildProductHeader(),
                      const Divider(thickness: 1.2),
                      _buildProductRow(
                        name: order.menuDetailsName ?? '',
                        price: "${order.quantitysPrice}",
                        qty: "${order.quantityCount}",
                        total: "${order.totalPrice}",
                      ),
                      const Divider(thickness: 1.2),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ المجموع
                _buildPriceRow("الإجمالي", "${order.totalPrice} ريال"),
                const SizedBox(height: 10),

                _buildPriceRow("التوصيل", "${order.ordersPricedelivery} ريال"),
                const SizedBox(height: 20),
                const Divider(thickness: 1.2),

                // ✅ الإجمالي النهائي
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _buildPriceRow(
                    "💰 الإجمالي النهائي",
                    "${controller.sum} ريال",
                    isBold: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 🔹 رأس جدول المنتجات
  Widget _buildProductHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Expanded(
            flex: 2,
            child: Text(
              "المنتج",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "السعر",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "الكمية",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "الإجمالي",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 صف منتج
  Widget _buildProductRow({
    required String name,
    required String price,
    required String qty,
    required String total,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 2, child: Text(name, textAlign: TextAlign.center)),
          Expanded(flex: 2, child: Text(price, textAlign: TextAlign.center)),
          Expanded(flex: 1, child: Text(qty, textAlign: TextAlign.center)),
          Expanded(flex: 2, child: Text(total, textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  // 🔹 تفاصيل الطلب (مع أيقونة)
  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Appcolors.orange, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: "Changa",
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Changa",
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 حالة الطلب
  Widget _buildOrderStatusStep({
    required bool isActive,
    required String number,
    required String text,
    bool isLast = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ✅ الدائرة
        CircleAvatar(
          radius: 13,
          backgroundColor: isActive ? Appcolors.orange : Colors.grey.shade400,
          child:
              isActive
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : Text(
                    number,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
        ),

        const SizedBox(height: 6),

        // ✅ النص أسفل الدائرة بمحاذاة متوسطة
        Text(
          text,
          style: TextStyle(
            fontFamily: "Changa",
            fontSize: 13,
            color: isActive ? Appcolors.orange : Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),

        // ✅ الخط السفلي إذا مش آخر دائرة
        if (!isLast)
          Container(
            width: 2,
            height: 30,
            color: Colors.grey.shade400,
            margin: const EdgeInsets.symmetric(vertical: 6),
          ),
      ],
    );
  }

  // 🔹 صف السعر
  Widget _buildPriceRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
            fontFamily: "Changa",
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
