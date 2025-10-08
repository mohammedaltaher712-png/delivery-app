import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/homebanner_controller.dart';
import 'package:order_delivery_application/core/class/handlingdataview.dart';
import 'package:order_delivery_application/data/model/CategoiresModel.dart';

class Customcategorylist extends StatelessWidget {
  const Customcategorylist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 2,
      // يسمح لـ GridView أن يتمدد في المساحة المتاحة
      child: GetBuilder<HomebannerController>(
        builder:
            (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                itemCount: controller.categ.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 130, // ارتفاع كل عنصر في الشبكة
                ),
                itemBuilder:
                    (context, index) => Category(
                      categoriesModel: controller.categ[index],
                      i: index,
                    ),
              ),
            ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key, this.i, required this.categoriesModel});
  final int? i;
  final CategoiresModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    HomebannerController controller = Get.put(HomebannerController());
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.goto(categoriesModel.categoryId.toString());
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 6,
                  spreadRadius: 5,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              imageUrl:
                  '${Linkapi.categoiresimage}/${categoriesModel.categoryImage}',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "${categoriesModel.categoryName}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
