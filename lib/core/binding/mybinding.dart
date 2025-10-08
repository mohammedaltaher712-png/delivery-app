import 'package:get/get.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
