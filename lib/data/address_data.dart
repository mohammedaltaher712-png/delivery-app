import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  save(
    String addressusersName,
    String addressusersDescription,
    String addressusersLatitude,
    String addressusersLongitude,
    String Token,
  ) async {
    var response = await crud.postDatas(Linkapi.Addaddress, {
      "addressusers_name": addressusersName,
      "addressusers_description": addressusersDescription,
      "addressusers_latitude": addressusersLatitude,
      "addressusers_longitude": addressusersLongitude,
    },Token);
    return response.fold((l) => l, (r) => r);
  }

  show(String Token) async {
    var response = await crud.postDatas(Linkapi.Showaddress, {
     
    },Token);
    return response.fold((l) => l, (r) => r);
  }
    deleted(String Token,String addressusers_id) async {
    var response = await crud.postDatas(Linkapi.deletedaddress, {
      "addressusers_id": addressusers_id.toString(),
    },Token);
    return response.fold((l) => l, (r) => r);
  }
}
