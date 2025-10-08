import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/address_data.dart';
import 'package:order_delivery_application/data/model/Addressmodel.dart';

class AddressviewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressdata = AddressData(Get.find());
  List<AddressModel> Addrsshow = [];
  MyServices myserivce = Get.find();
  bool showBottomSheet = false;

  show() async {
    Addrsshow.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressdata.show(
      myserivce.sharedPreferences.getString("token").toString(),
    );
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];
        Addrsshow.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    } else {}
    update();
  }

  Future<void> deleted(String addressusersId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await addressdata.deleted(
      myserivce.sharedPreferences.getString("token").toString(),
      addressusersId,
    );

    if (response['status'] == "success") {
      Get.defaultDialog(title: "إشعار", middleText: "تم إزالة العنوان");

      // بعد الحذف، أعد تحميل البيانات من السيرفر
      await show();
    } else {
      Get.defaultDialog(title: "خطأ", middleText: "حدث خطأ أثناء الحذف");
    }
  }

  var selected = Rxn<AddressModel>();

  void selectedAddress(AddressModel Addrsshow) {
    selected.value = Addrsshow;
  }

  @override
  void onInit() {
    show();
    super.onInit();
  }
}
