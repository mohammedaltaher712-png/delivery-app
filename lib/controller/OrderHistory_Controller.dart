import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/model/ordersmodle.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';
import 'package:order_delivery_application/data/orderhistory_data.dart';
import 'package:order_delivery_application/data/serivecs_data.dart';

class OrderhistoryController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  OrderhistoryData orderhistoryData = OrderhistoryData(Get.find());
  late String itemsId;
  List<OrdersModle> ordershow = [];
  MyServices myserivce = Get.find();

  view() async {
    ordershow.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await orderhistoryData.orderview(
      myserivce.sharedPreferences.getString("token").toString(),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];
        ordershow.addAll(data.map((e) => OrdersModle.fromJson(e)));
        // Map<String,dynamic> data = response['data'];
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  intialData() async {
    bool isConnected = await checkInternetWithDialog(intialData);

    if (!isConnected) {
      // لا تكمل تحميل البيانات لأن النت غير متصل
      return;
    }

    view();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
String timeAgo(String dateString) {
  try {
    if (dateString.isEmpty) return "Unknown";

    // استخدام Jiffy.parse مع النص القادم من Laravel
    Jiffy jiffy = Jiffy.parse(dateString);

    // عرض الوقت النسبي
    return jiffy.fromNow();
  } catch (e) {
    print("Error parsing date: $e");
    return "Invalid date";
  }
}