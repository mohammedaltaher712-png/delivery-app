// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text(
            "Yes",
            style:
                TextStyle(color: Appcolors.orange, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("No"),
        ),
      ]);
  return Future.value(true);
}
