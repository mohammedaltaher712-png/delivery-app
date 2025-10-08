import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/home_data.dart';
import 'package:order_delivery_application/data/model/CategoiresModel.dart';
import 'package:order_delivery_application/data/model/homebannerModel.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';

class HomebannerController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<HomeBannerModle> banner = [];
  MyServices myserivce = Get.find();
  RxString address = ''.obs;
  List<CategoiresModel> categ = [];
  List<SerivecsModel> listdata = [];

  bannerview() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.banner();
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];

        banner.addAll(data.map((e) => HomeBannerModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.categoies();
    // print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        categ.clear();
        categ.addAll(data.map((e) => CategoiresModel.fromJson(e)));

        // اختيار أول قسم تلقائيًا لو القائمة مش فاضية
        if (categ.isNotEmpty) {
          currentIndex = 0;
          // لو في دالة تحتاجها لتحديث القسم المعروض على حسب currentIndex تقدر تناديها هنا
          // مثلاً: changeCategory(currentIndex);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  goto(String i) {
    Get.toNamed(Approute.Categoires, arguments: {"categoiresId": i});
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.Services(
      myserivce.sharedPreferences.getString("token").toString(),

      search!.text,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => SerivecsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  int currentIndex = 0;

  chage(int i) {
    currentIndex = i;
    update();
  }

  refreshPage() {
    bannerview();
    view();
  }

  String? token;
  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    } else {
      isSearch = true;
      searchData();
    }
    update();
  }
 gotipage(serivecsModel) {
    Get.toNamed(Approute.Detail, arguments: {'serivecsModel': serivecsModel});
  }
  
  @override
  void onInit() {
    search = TextEditingController();
    bannerview();
    token = myserivce.sharedPreferences.getString("token");
    if (Get.arguments != null && Get.arguments["addressusersName"] != null) {
      address = Get.arguments["addressusersName"];
    }
    view();
    super.onInit();
  }
}
