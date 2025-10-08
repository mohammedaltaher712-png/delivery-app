import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class CouponData {
  Crud crud;

  CouponData(this.crud);

  Couponview(String Token) async {
    var response = await crud.postDatas(Linkapi.couponview, {}, Token);
    return response.fold((l) => l, (r) => r);
  }
  Paymentview(String Token) async {
    var response = await crud.postDatas(Linkapi.Paymentview, {}, Token);
    return response.fold((l) => l, (r) => r);
  }
   ordersadd(String Token,Map data) async {
    var response = await crud.postDatas(Linkapi.ordersadd, data, Token);
    return response.fold((l) => l, (r) => r);
  }

   deliveryPriceShow() async {
    var response = await crud.postData(Linkapi.deliveryPriceShow,{});
    return response.fold((l) => l, (r) => r);
  }
}
