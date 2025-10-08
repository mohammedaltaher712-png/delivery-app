import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class DetailsData {
  Crud crud;

  DetailsData(this.crud);

  show( String token, String detailsListDetai) async {
    var response = await crud.postDatas(Linkapi.Detailsshow, {
      "quantitys_menu_details": detailsListDetai.toString(),
    },token);
    return response.fold((l) => l, (r) => r);
  }

  save(String token, Map data) async {
    var response = await crud.postDatas(Linkapi.cardadd, data, token);
    return response.fold((l) => l, (r) => r);
  }

  viewnum(String token) async {
    var response = await crud.postDatas(Linkapi.cardnum, {}, token);
    return response.fold((l) => l, (r) => r);
  }

  Remove(String token, String id) async {
    var response = await crud.postDatas(Linkapi.cardRemve, {
      "carts_quantitys": id.toString(),
    }, token);
    return response.fold((l) => l, (r) => r);
  }

RemoveAll(String token, String id) async {
    var response = await crud.postDatas(Linkapi.cardRemveAll, {
      "carts_quantitys": id.toString(),
    }, token);
    return response.fold((l) => l, (r) => r);
  }
  viewprice(String token) async {
    var response = await crud.postDatas(Linkapi.cardviewprice, {}, token);
    return response.fold((l) => l, (r) => r);
  }
}
