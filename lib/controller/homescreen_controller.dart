import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/screen/view/Home.dart';
import 'package:order_delivery_application/screen/view/myfavorite.dart';
import 'package:order_delivery_application/screen/view/orderhistory.dart';
import 'package:order_delivery_application/screen/view/setting.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const Home(),
   
   OrderHistory(),
   Myfavorite(),
   Settings(),
  ];

  List bottomappbar = [
    {"title": "الرئيسية", "icon": Icons.home},
    {"title": "طلباتي", "icon": Icons.list_alt},
    {"title": "مفضلتي", "icon": Icons.favorite_border},
    {"title": "حسابي", "icon": Icons.person_2_outlined},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
