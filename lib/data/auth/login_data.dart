import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  login(String email, String password) async {
    var response = await crud.postData(Linkapi.login, {
      "users_email": email,
      "users_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
