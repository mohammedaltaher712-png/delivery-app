import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:order_delivery_application/controller/Address/addressview_controller.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/functions/handingdatacontroller.dart';
import 'package:order_delivery_application/core/services/service.dart';
import 'package:order_delivery_application/data/address_data.dart';

class AddressController extends GetxController {
  List<Marker> markers = []; // لتخزين العلامات (Markers)
  MapController mapController = MapController();
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  double? lat;
  double? long;
  TextEditingController? name;
  TextEditingController? city;
  late GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myserivce = Get.find();
  AddressData addressData = AddressData(Get.find());

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    getCurrentLocation();
    super.onInit();
  }

  void addMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(
        point: position,
        width: 40,
        height: 40,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    );
    lat = position.latitude;
    long = position.longitude;

    mapController.move(position, 15);
    update();
  }

  AddressviewController controller = Get.put(AddressviewController());
  add() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.save(
        name!.text,
        city!.text,

        lat!.toString(),
        long!.toString(),
        myserivce.sharedPreferences.getString("token").toString(),
      );
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          controller.show();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
