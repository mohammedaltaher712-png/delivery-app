import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/data/model/ordersmodle.dart';

class OrderhistorydetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  OrdersModle? ordersModle;

  int get delivery => ordersModle?.ordersPricedelivery ?? 0;

  int get total => int.tryParse(ordersModle?.totalPrice ?? '') ?? 0;

  int get sum => delivery + total;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['ordersModle'] != null) {
      ordersModle = Get.arguments['ordersModle'];
    } else {
      print("⚠️ لم يتم تمرير CartView");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }
    super.onInit();
  }
}
