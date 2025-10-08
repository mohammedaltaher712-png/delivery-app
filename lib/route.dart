import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:order_delivery_application/core/constant/AppRoute.dart';
import 'package:order_delivery_application/screen/view/Detail.dart';
import 'package:order_delivery_application/screen/view/Home.dart';
import 'package:order_delivery_application/screen/view/WelcomePage.dart';
import 'package:order_delivery_application/screen/view/address/Address.dart';
import 'package:order_delivery_application/screen/view/address/Addressview.dart';
import 'package:order_delivery_application/screen/view/auth/login.dart';
import 'package:order_delivery_application/screen/view/auth/regster.dart';
import 'package:order_delivery_application/screen/view/cart.dart';
import 'package:order_delivery_application/screen/view/categoires.dart';
import 'package:order_delivery_application/screen/view/chekout.dart';
import 'package:order_delivery_application/screen/view/fooddetiles.dart';
import 'package:order_delivery_application/screen/view/homescreen.dart';
import 'package:order_delivery_application/screen/view/orderhistory.dart';
import 'package:order_delivery_application/screen/view/orderhistorydetails.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => const Welcomepage()),
  GetPage(name: Approute.HomeScreen, page: () => const HomeScreen()),
  GetPage(name: Approute.Login, page: () => const Login()),
  GetPage(name: Approute.Regster, page: () => const Regster()),
  GetPage(name: Approute.Categoires, page: () => const Categoires()),
  GetPage(name: Approute.Detail, page: () => const Detail()),
  GetPage(name: Approute.Address, page: () => Address()),
  GetPage(name: Approute.Addressview, page: () => Addressview()),
  GetPage(name: Approute.Fooddetiles, page: () => Fooddetiles()),
    GetPage(name: Approute.Cart, page: () => Cart()),
    GetPage(name: Approute.Invoicepage, page: () => Invoicepage()),
    GetPage(name: Approute.OrderHistory, page: () => OrderHistory()),
    GetPage(name: Approute.Orderhistorydetails, page: () => Orderhistorydetails()),

];
