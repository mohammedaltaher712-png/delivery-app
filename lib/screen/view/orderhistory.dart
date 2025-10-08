import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/OrderHistory_Controller.dart';
import 'package:order_delivery_application/screen/widget/OrderHistory/customlist.dart';
import 'package:order_delivery_application/screen/widget/customtitleAppbar.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderhistoryController());

    return Scaffold(
      appBar: CustomTitleAppBar(title: "سجل الطلبات"),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Customlist(),
      ),
    );
  }
}
