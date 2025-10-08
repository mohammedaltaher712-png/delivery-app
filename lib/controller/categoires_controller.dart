import 'package:get/get.dart';
import 'package:order_delivery_application/controller/favorite_controller.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/categoires_data.dart';
import 'package:order_delivery_application/data/favorite_data.dart';
import 'package:order_delivery_application/data/model/BannerCategoryModel.dart';
import 'package:order_delivery_application/data/model/ItemsModel.dart';
import 'package:order_delivery_application/data/model/myfavoritesmodle.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';
import 'package:order_delivery_application/data/model/serivecswithcategorymodel.dart';

class CategoiresController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CategoiresData categoiresData = CategoiresData(Get.find());
  late String categoryId;
  List<MyfavoritesModle> favoritesView = [];

  List<BannerCategoryModel> categ = [];
  List<ItemsModel> itemslist = [];
  List<SerivecsModel> itemslistserivecs = [];
  List<SerivecswithcategoryModel> itemscate = [];
  int? selectedmenu;
  int? selecteditems;
  int currentIndex = 0;
  List data = [];
  FavoriteData favoriteData = FavoriteData(Get.find());
  FavoriteController favoriteController = Get.put(FavoriteController());
  MyServices myserivce = Get.find();

  Map isFavorite = {};

  //  key => id items
  //  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String SerivcesId) async {
    statusRequestServices = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myserivce.sharedPreferences.getString("token").toString(),
      SerivcesId,
    );
    print("=============================== Controller $response ");
    statusRequestServices = handlingData(response);
    if (statusRequestServices == StatusRequest.success) {
      // Start backend
      if (response['status'] == "success") {
        // data.addAll(response['data']);
      } else {
        statusRequestServices = StatusRequest.failure;
      }
      // End
    }
  }

  removeFavorite(String SerivcesId) async {
    // itemslistserivecs.clear();
    statusRequestServices = StatusRequest.loading;

    var response = await favoriteData.removeFavorite(
      myserivce.sharedPreferences.getString("token").toString(),
      SerivcesId,
    );
    print("=============================== Controller $response ");
    statusRequestServices = handlingData(response);
    if (statusRequestServices == StatusRequest.success) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusRequestServices = StatusRequest.failure;
      }
      // End
    }
  }

  view(String i) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoiresData.bannercategoies(i);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List data = response['data'];
        categ.addAll(data.map((e) => BannerCategoryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  viewitems(String i) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await categoiresData.items(i);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        itemslist.clear();
        List data = response['data'];
        itemslist.addAll(data.map((e) => ItemsModel.fromJson(e)));

        if (itemslist.isNotEmpty) {
          selectedmenu = 0;
          selecteditems = itemslist[0].itemsId;
          changeitems(selectedmenu!, selecteditems!);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  StatusRequest statusRequestServices = StatusRequest.none;
  viewSerivecs(String i) async {
    statusRequestServices = StatusRequest.loading;
    update();

    var response = await categoiresData.Serivecs(
      myserivce.sharedPreferences.getString("token").toString(),
      i,
    );
    print("=============================== Controller $response ");

    itemslistserivecs.clear();

    statusRequestServices = handlingData(response);
    if (statusRequestServices == StatusRequest.success) {
      if (response['status'] == "success") {
        List data = response['data'];
        itemslistserivecs.addAll(data.map((e) => SerivecsModel.fromJson(e)));
      } else {
        statusRequestServices = StatusRequest.failure;
      }
    }
    update();
  }

  chage(int i) {
    currentIndex = i;
    update();
  }

  gotipage(serivecsModel) {
    Get.toNamed(Approute.Detail, arguments: {'serivecsModel': serivecsModel});
  }

  changeitems(val, i) {
    selectedmenu = val;
    selecteditems = i;
    viewSerivecs(selecteditems.toString());

    update();
  }

  ref() async {
    await favoriteController.viewfavorites();
    await viewSerivecs(selecteditems.toString());
  }

  intialData() async {
    bool isConnected = await checkInternetWithDialog(intialData);
    String? token = myserivce.sharedPreferences.getString("token");
    if (!isConnected) {
      // لا تكمل تحميل البيانات لأن النت غير متصل
      return;
    }
    if (token == null || token.isEmpty) {
       return Get.offAllNamed(Approute.Login);
    }
    categoryId = Get.arguments["categoiresId"];

    await viewAll(categoryId);
    await viewSerivecs(selecteditems.toString());

    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  viewAll(String categoryId) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      final responses = await Future.wait<dynamic>([
        categoiresData.bannercategoies(categoryId),
        categoiresData.items(categoryId),
        categoiresData.Serivecscate(categoryId),
      ]);

      statusRequest = handlingData(responses[0]);

      if (StatusRequest.success == statusRequest) {
        categ.clear();
        itemslist.clear();
        itemscate.clear();

        if (responses[0]['status'] == "success") {
          List dataBanner = responses[0]['data'];
          categ.addAll(dataBanner.map((e) => BannerCategoryModel.fromJson(e)));
        }

        if (responses[1]['status'] == "success") {
          List dataItems = responses[1]['data'];
          itemslist.addAll(dataItems.map((e) => ItemsModel.fromJson(e)));

          // تعيين أول عنصر مختار تلقائياً
          if (itemslist.isNotEmpty) {
            selectedmenu = 0;
            selecteditems = itemslist[0].itemsId;
            // استدعاء changeitems لتفعيل العنصر وتحميل بياناته
            changeitems(selectedmenu!, selecteditems!);
          }
        }

        if (responses[2]['status'] == "success") {
          List dataServices = responses[2]['data'];
          itemscate.addAll(
            dataServices.map((e) => SerivecswithcategoryModel.fromJson(e)),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
