import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

// دالة لعرض الـ Dialog بشكل عام
void showCustomDialog({
  required String title,
  required String middleText,
  required VoidCallback onConfirm, // العمل عند الضغط على زر "نعم"
  required VoidCallback onCancel,   // العمل عند الضغط على زر "لا"
}) {
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
      color: Appcolors.orange,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    middleText: middleText,
    middleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    backgroundColor: Colors.white,
    radius: 15,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    actions: [
      // زر نعم
      TextButton(
        onPressed: onConfirm, // تنفيذ الـ onConfirm عند الضغط على زر "نعم"
        style: TextButton.styleFrom(
          backgroundColor: Appcolors.orange, // لون خلفية الزر
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // حواف مريحة
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              "نعم",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      // زر لا
      TextButton(
        onPressed: onCancel, // تنفيذ الـ onCancel عند الضغط على زر "لا"
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cancel,
              color: Colors.red,
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              "لا",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
