import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/categoires_controller.dart';
import 'package:order_delivery_application/data/model/ItemsModel.dart';

class Customitem extends StatelessWidget {
  const Customitem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoiresController>(
      builder:
          (controller) => SizedBox(
            height: Get.height / 6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.itemslist.length,
              itemBuilder: (context, index) {
                final item = controller.itemslist[index];
                return card(itemsModel: controller.itemslist[index], i: index);
              },
            ),
          ),
    );
  }
}

class card extends GetView<CategoiresController> {
  const card({super.key, required this.i, required this.itemsModel});
  final int? i;
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeitems(i, itemsModel.itemsId);
      },
      child: SizedBox(
        width: 110,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border:
                  controller.selectedmenu == i
                      ? Border.all(
                        color: Colors.orange, // اختر اللون الذي يناسبك
                        width: 2,
                      )
                      : null,
            ),
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300), // مدة الحركة
                    transform: Matrix4.translationValues(
                      0,
                      controller.selectedmenu == i ? -8 : 0,
                      0,
                    ),
                    child: CachedNetworkImage(
                      height: 40,
                      fit: BoxFit.fill,
                      imageUrl:
                          "${Linkapi.itemsimage}/${itemsModel.itemsImage ?? 'default.png'}",
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${itemsModel.itemsName}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
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
