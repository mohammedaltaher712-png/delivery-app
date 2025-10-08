import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/Address/addressview_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';

class Addressview extends StatelessWidget {
  const Addressview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressviewController());

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "عناويني",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<AddressviewController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:
                  controller.Addrsshow.isNotEmpty
                      ? ListView.builder(
                        padding: const EdgeInsets.all(15),
                        itemCount: controller.Addrsshow.length,
                        itemBuilder: (context, index) {
                          final address = controller.Addrsshow[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            color: Colors.white,
                            child: ListTile(
                              onTap: () {
                                controller.selectedAddress(address);

                                Get.back(result: address.toJson());
                              },
                              contentPadding: const EdgeInsets.all(16),
                              leading: CircleAvatar(
                                backgroundColor: Appcolors.orange.withOpacity(
                                  0.1,
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Appcolors.orange,
                                ),
                              ),
                              title: Text(
                                address.addressusersName ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                address.addressusersDescription ?? "",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  controller.deleted(
                                    address.addressusersId.toString(),
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                      : Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_off,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "لا توجد عناوين مضافة بعد",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              TextButton.icon(
                                onPressed: () {
                                  Get.toNamed(Approute.Address);
                                },
                                icon: const Icon(
                                  Icons.add_location_alt_rounded,
                                ),
                                label: const Text("إضافة عنوان جديد"),
                                style: TextButton.styleFrom(
                                  foregroundColor: Appcolors.orange,
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
            ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Approute.Address);
        },
        backgroundColor: Appcolors.orange,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("عنوان جديد", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
