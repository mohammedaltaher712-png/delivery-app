import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/core/class/crud.dart';

class RegisterData {
  Crud crud;

  RegisterData(this.crud);

  register(String name, String email, String phone, String password) async {
    var response = await crud.postData(Linkapi.register, {
      "users_name": name,
      "users_email": email,
      "users_phone": phone,
      "users_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
