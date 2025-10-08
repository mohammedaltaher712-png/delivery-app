import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';
import 'package:order_delivery_application/data/serivecs_data.dart';

class SerivecsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  SerivecsData serivecsData = SerivecsData(Get.find());
  late String itemsId;
  List<SerivecsModel> itemslist = [];

  view(String i) async {
    statusRequest = StatusRequest.loading;
    var response = await serivecsData.Serivecs(i);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];
        itemslist.addAll(data.map((e) => SerivecsModel.fromJson(e)));
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
    itemsId = Get.arguments["itemsId"];

    view(itemsId);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
