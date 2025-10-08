import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  banner() async {
    var response = await crud.postData(Linkapi.bannerhome, {});
    return response.fold((l) => l, (r) => r);
  }

  categoies() async {
    var response = await crud.postData(Linkapi.cate, {});
    return response.fold((l) => l, (r) => r);
  }

  Services(String Token, String query) async {
    var response = await crud.postDatas(Linkapi.Serivecssearch, {
      "query": query,
    }, Token);
    return response.fold((l) => l, (r) => r);
  }
}
