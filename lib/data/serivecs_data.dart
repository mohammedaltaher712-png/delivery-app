import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class SerivecsData {
  Crud crud;

  SerivecsData(this.crud);

  Serivecs(String itemsid) async {
    var response = await crud.postData(Linkapi.Serivecs, {
      "itemsid": itemsid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
   Serivecscate(String categoires_id) async {
    var response = await crud.postData(Linkapi.Serivecscate, {
      "categoires_id": categoires_id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
