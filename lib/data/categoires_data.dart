import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class CategoiresData {
  Crud crud;

  CategoiresData(this.crud);

  categoies() async {
    var response = await crud.postData(Linkapi.cate, {});
    return response.fold((l) => l, (r) => r);
  }

  bannercategoies(String categoryId) async {
    var response = await crud.postData(Linkapi.bannercategory, {
      "category_id": categoryId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  items(String categoryId) async {
    var response = await crud.postData(Linkapi.items, {
      "items_category": categoryId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  Serivecs(String Token, String itemsid) async {
    var response = await crud.postDatas(Linkapi.Serivecs, {
      "items_id": itemsid.toString(),
    }, Token);
    return response.fold((l) => l, (r) => r);
  }

  Serivecscate(String categoiresId) async {
    var response = await crud.postData(Linkapi.Serivecscate, {
      "services_category": categoiresId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
