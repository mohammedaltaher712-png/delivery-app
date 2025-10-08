import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customcart extends StatelessWidget {
  const Customcart({super.key, this.onTap1, required this.title1, required this.title2, this.onTap2});
  final void Function()? onTap1;
  final String title1;
    final String title2;
      final void Function()? onTap2;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: Get.width,
      height: Get.height / 10,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Appcolors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // النص: الاجمالي
              const SizedBox(width: 8),

              // ✅ أيقونة السلة مع البادج
              GestureDetector(
                onTap: onTap1,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white, // خلفية برتقالية شفافة
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Appcolors.orange,
                        size: 30,
                      ),
                    ),

                    Positioned(
                      top: -5,
                      right: -1,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                         title1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "الاجمالي",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                  title2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // ✅ معاينة السلة
          InkWell(
            onTap: onTap2,
            child: const Text(
              "معاينة السلة",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ✅ السعر و الأيقونة
        ],
      ),
    );
  }
}
