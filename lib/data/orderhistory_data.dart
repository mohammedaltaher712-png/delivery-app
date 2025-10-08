import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class OrderhistoryData {
  Crud crud;

  OrderhistoryData(this.crud);

  orderview(String Token) async {
    var response = await crud.postDatas(Linkapi.ordersShow, {}, Token);
    return response.fold((l) => l, (r) => r);
  }
  
 
}
