import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/details_data.dart';
import 'package:order_delivery_application/data/menu_data.dart';
import 'package:order_delivery_application/data/model/cardpricemodle.dart';
import 'package:order_delivery_application/data/model/list_detaismodel.dart';
import 'package:order_delivery_application/data/model/menumodel.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';

class DetailController extends GetxController {
  // List<MenuModel> datas = [];
  SerivecsModel? serivecsModel;
  DetailsData detailsData = DetailsData(Get.find());

  @override
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myserivce = Get.find();
  int? prices;
  MenuData menuData = MenuData(Get.find());
  var totalPriceUsers;
  List<CartModle> CartView = [];

  List<MenuModel> menuserivces = [];
  List<MenuDetailModel> list_detai_menus = [];
  List<MenuDetailModel> list_detai_menus2 = [];

  String? ta;
  String? ta1;
  int? selectedCat;
  String? catid;
  MenuViewitems(String id) async {
    menuserivces.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await menuData.showmenu(id);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        menuserivces.addAll(data.map((e) => MenuModel.fromJson(e)));

        // ✅ استدعاء أول قسم تلقائيًا
        if (menuserivces.isNotEmpty) {
          changeSerivceitms(0, menuserivces[0].menusId.toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  list_detaisViewitems(String id) async {
    list_detai_menus.clear();
    statusRequest = StatusRequest.loading;
    var response = await menuData.showlist_detais(id);
    print("=============================== Controيller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List data = response['data'];
        list_detai_menus.addAll(data.map((e) => MenuDetailModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  // StatusRequest statusRequestServices = StatusRequest.none;

  gotipage(listDetaismodel) {
    // print(servicesId);
    Get.toNamed(
      Approute.Fooddetiles,
      arguments: {'listDetaismodel': listDetaismodel},
    );
  }

  gotipagecart(serivecsModel) {
    // print(servicesId);
    Get.toNamed(Approute.Cart, arguments: {'serivecsModel': serivecsModel});
  }

  changeSerivceitms(val, catval) {
    selectedCat = val;
    catid = catval;
    print(catid);
    list_detaisViewitems(catid!);
    update();
  }

  int basket = 0;
  changecard() {
    basket = basket == 1 ? 0 : 1;

    update();
  }

  double totalPrice = 0.0;
  int countcard = 0;
  viewCard() async {
    update();
    var response = await detailsData.viewprice(
      myserivce.sharedPreferences.getString("token").toString(),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        CartView.clear();

        List data = response['data'];
        CartView.addAll(data.map((e) => CartModle.fromJson(e)));
        totalPrice = response['count'].toDouble();
        countcard = int.parse(response['tot'].toString());
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
    viewCard();

    if (Get.arguments != null && Get.arguments['serivecsModel'] != null) {
      serivecsModel = Get.arguments['serivecsModel'];
      MenuViewitems(serivecsModel!.servicesId.toString());
    } else {
      // تعامَل مع حالة غياب البيانات كما تريد
      print("خطأ: لم يتم تمرير serivecsModel في arguments");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments['serivecsModel'] != null) {
      serivecsModel = Get.arguments['serivecsModel'];
      MenuViewitems(serivecsModel!.servicesId.toString());
    } else {
      // تعامَل مع حالة غياب البيانات كما تريد
      print("خطأ: لم يتم تمرير serivecsModel في arguments");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }
    intialData();

    super.onInit();
  }
}
