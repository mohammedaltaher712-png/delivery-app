import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String Token, String favoritesServices) async {
    var response = await crud.postDatas(Linkapi.favoriteAdd, {
      "favorites_services": favoritesServices,
    }, Token);
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String Token, String favoritesServices) async {
    var response = await crud.postDatas(Linkapi.favoriteRemove, {
      "favorites_services": favoritesServices,
    }, Token);
    return response.fold((l) => l, (r) => r);
  }
 ShowFavorite(String Token) async {
    var response = await crud.postDatas(Linkapi.favoriteShow, {
    }, Token);
    return response.fold((l) => l, (r) => r);
  }
}
