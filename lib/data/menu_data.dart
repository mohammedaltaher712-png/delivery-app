import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class MenuData {
  Crud crud;

  MenuData(this.crud);

  showmenu(String menusServices) async {
    var response = await crud.postData(Linkapi.menushow, {
      "menus_services": menusServices.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  showlist_detais(String listDetaiMenus) async {
    var response = await crud.postData(Linkapi.list_detais, {
      "menu_details_menus": listDetaiMenus.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  showlist_detais2(String listDetaiSerivecs) async {
    var response = await crud.postData(Linkapi.list_detais2, {
      "list_detai_serivecs": listDetaiSerivecs.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
