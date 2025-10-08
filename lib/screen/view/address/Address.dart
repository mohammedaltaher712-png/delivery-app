import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:nominatim_flutter/model/request/search_request.dart';
import 'package:nominatim_flutter/nominatim_flutter.dart';
import 'package:order_delivery_application/controller/address_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/functions/validinput.dart';
import 'package:order_delivery_application/screen/widget/customTextFromFeild.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerpage = Get.put(AddressController());
    final nominatim = NominatimFlutter.instance;
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'إضافة عنوان جديد',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<AddressController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: controller.formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // حقل البحث
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'ابحث عن موقع...',
                            prefixIcon: const Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                          onSubmitted: (query) async {
                            if (query.trim().isEmpty) return;

                            final results = await nominatim.search(
                              searchRequest: SearchRequest(
                                query: query,
                                limit: 5,
                              ),
                              language: 'en',
                            );

                            if (results.isNotEmpty) {
                              final first = results.first;
                              final lat = double.parse(first.lat!);
                              final lon = double.parse(first.lon!);

                              controllerpage.mapController.move(
                                LatLng(lat, lon),
                                15.0,
                              );
                              controllerpage.addMarker(LatLng(lat, lon));
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // الخريطة
                      if (controllerpage.position != null)
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              height: 300,
                              child: FlutterMap(
                                mapController: controllerpage.mapController,
                                options: MapOptions(
                                  initialCenter: LatLng(
                                    controllerpage.position!.latitude,
                                    controllerpage.position!.longitude,
                                  ),
                                  initialZoom: 15.0,
                                  onTap:
                                      (tapPosition, point) =>
                                          controllerpage.addMarker(point),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    subdomains: ['a', 'b', 'c'],
                                  ),
                                  MarkerLayer(markers: controllerpage.markers),
                                ],
                              ),
                            ),
                          ),
                        ),

                      const SizedBox(height: 20),

                      // حقل العنوان
                      CustomTextFromFeild(
                        hintText: "العنوان",
                        label: "العنوان",
                        IconData: Icons.location_on,
                        isNumber: false,
                        obscureText: false,
                        validator: (val) {
                          return validInput(val!, 10, 50, "address");
                        },
                        controllerMy: controller.name,
                      ),

                      const SizedBox(height: 10),

                      // وصف العنوان
                      CustomTextFromFeild(
                        hintText: "وصف العنوان",
                        label: "الوصف",
                        IconData: Icons.location_city,
                        isNumber: false,
                        obscureText: false,
                        validator: (val) {
                          return validInput(val!, 20, 50, "address2");
                        },
                        controllerMy: controller.city,
                      ),

                      const SizedBox(height: 25),

                      // زر الإضافة
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (controller.lat == null ||
                                controller.long == null) {
                              Get.defaultDialog(
                                title: "خطأ",
                                titleStyle: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                middleText: "الرجاء تحديد الموقع على الخريطة",
                                middleTextStyle: const TextStyle(fontSize: 16),
                                textConfirm: "حسنًا",
                                confirmTextColor: Colors.white,
                                onConfirm: () => Get.back(),
                                barrierDismissible: false,
                                radius: 10,
                                backgroundColor: Colors.white,
                              );
                            } else {
                              controller.add();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          icon: const Icon(
                            Icons.add_location_alt,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "إضافة العنوان",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
