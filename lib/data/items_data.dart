import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

 

  items(String categoryId) async {
    var response = await crud.postData(Linkapi.items, {
      "categoires_id": categoryId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
