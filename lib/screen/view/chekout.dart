import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/Invoice_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/data/model/Addressmodel.dart';
import 'package:order_delivery_application/data/model/couponmodle.dart';
import 'package:order_delivery_application/screen/widget/Chekout/customBasket_summaryContainer.dart';
import 'package:order_delivery_application/screen/widget/Chekout/customPayment_summaryContainer.dart';
import 'package:order_delivery_application/screen/widget/Chekout/customaddresscontainer.dart';
import 'package:order_delivery_application/screen/widget/Chekout/customcommentsContainer.dart';
import 'package:order_delivery_application/screen/widget/Chekout/customcouponcontainer.dart';
import 'package:order_delivery_application/screen/widget/Chekout/custompayment_methodContainer.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';

class Invoicepage extends StatelessWidget {
  const Invoicepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<InvoiceController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  color: Appcolors.Lsitca,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Appcolors.orange,
                  onPressed: () {
                    controller.checkout();
                  },
                  child: Text(
                    "تنفيذ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
      ),

      appBar: CustomTitleAppBar(title: "الفاتورة"),

      body: GetBuilder<InvoiceController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: () {
                return controller.intialData();
              },
              child: ListView(
                children: [
                  Customaddresscontainer(
                    selectedAddress: controller.selectedAddress.value,
                    onChangeAddressPressed: () async {
                      final result = await Get.toNamed(Approute.Addressview);

                      if (result != null && result is Map<String, dynamic>) {
                        controller
                            .selectedAddress
                            .value = AddressModel.fromJson(result);
                        final distance =
                            await controller
                                .calculateDistanceBetweenUserAndService();
                        controller.distanceInKm = distance;
                        controller.deliveryPrice = controller.calculatePrice(
                          distance,
                        );
                        controller.update();
                      }
                    },
                    onSelectAddress: () async {
                      final result = await Get.toNamed(Approute.Addressview);
                      if (result != null && result is Map<String, dynamic>) {
                        controller
                            .selectedAddress
                            .value = AddressModel.fromJson(result);
                        final distance =
                            await controller
                                .calculateDistanceBetweenUserAndService();
                        controller.distanceInKm = distance;
                        controller.deliveryPrice = controller.calculatePrice(
                          distance,
                        );
                        controller.update();
                        return controller.selectedAddress.value;
                      }
                      return null;
                    },
                    distanceInKm: controller.distanceInKm,
                    deliveryPrice: controller.deliveryPrice,
                  ),
                  Customcouponcontainer(
                    coupons: controller.coupon,
                    selectedCoupon: controller.couponModle,
                    onSelectCoupon: (selected) {
                      controller.couponModle = selected;
                      controller.discountcoupon =
                          selected?.couponsDiscount ?? 0;
                      controller.update();
                    },
                    onActivateCoupon: () {
                      if (controller.couponModle != null) {
                        controller.statuscoupon = 1;
                        controller.update();
                      } else {
                        Get.snackbar("تنبيه", "الرجاء اختيار كوبون أولاً");
                      }
                    },

                    itemBuilder: (CouponModle coupon) {
                      return Row(
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: Appcolors.orange,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "${coupon.couponsName} - خصم ${coupon.couponsDiscount}%",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      );
                    },
                  ),

                  customBasket_summaryContainer(
                    title: "ملخص السلة",
                    productColumnTitle: "المنتج",
                    priceColumnTitle: "السعر",
                    quantityColumnTitle: "الكمية",
                    totalColumnTitle: "الإجمالي",
                    cartItems: controller.CartView,
                  ),
                  CustomPaymentSummaryContainer(
                    title: "ملخص الدفع",
                    cartItems: controller.CartView,
                    deliveryPrice:
                        controller.deliveryPrice == 100
                            ? null
                            : controller.deliveryPrice,
                    totalWithDelivery: controller.finalTotalWithDelivery,
                    discountCoupon: controller.discountcoupon ?? 0,
                    statusCoupon: controller.statuscoupon,
                    deliveryLabel: "سعر التوصيل",
                    totalLabel: "إجمالي السلة",
                  ),

                  CustomPaymentMethodContainer(
                    title: "طريقة الدفع",
                    paymentOptions: controller.Paymentshow,
                    selectedPaymentId: controller.currentIndexPayment,
                    onPaymentSelected: (val) => controller.changePayment(val),
                  ),

                  Customcommentscontainer(
                    title1: " الملاحظات ",
                    title2: "أضف ملاحظاتك هنا",
                    controller: controller.comments,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
