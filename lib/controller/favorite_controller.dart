import 'package:get/get.dart';

import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/favorite_data.dart';
import 'package:order_delivery_application/data/model/myfavoritesmodle.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];
  MyServices myserivce = Get.find();

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  List<SerivecsModel> favoritesView = [];
  StatusRequest statusRequestServices = StatusRequest.none;

  Map isFavorite = {};

  //  key => id items
  //  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }
 gotipage(serivecsModel) {
    Get.toNamed(Approute.Detail, arguments: {'serivecsModel': serivecsModel});
  }
  addFavorite(String favoritesServices) async {
    statusRequestServices = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myserivce.sharedPreferences.getString("token").toString(),
      favoritesServices,
    );
    print("=============================== Controller $response ");
    statusRequestServices = handlingData(response);
    if (statusRequestServices == StatusRequest.success) {
      // Start backend
      if (response['status'] == "success") {
        viewfavorites();
      } else {
        statusRequestServices = StatusRequest.failure;
      }
      // End
    }
  }

  removeFavorite(String favoritesServices) async {
    statusRequestServices = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
      myserivce.sharedPreferences.getString("token").toString(),
      favoritesServices,
    );
    print("=============================== Controller $response ");
    statusRequestServices = handlingData(response);
    if (statusRequestServices == StatusRequest.success) {
      // Start backend
      if (response['status'] == "success") {
        viewfavorites();
      } else {
        statusRequestServices = StatusRequest.failure;
      }
      // End
    }
  }

  viewfavorites() async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await favoriteData.ShowFavorite(
      myserivce.sharedPreferences.getString("token").toString(),
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        favoritesView.clear();

        List data = response['data'];
        favoritesView.addAll(data.map((e) => SerivecsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    viewfavorites();
    super.onInit();
  }
}
