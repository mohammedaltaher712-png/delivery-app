import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "name") {
    final nameRegExp = RegExp(r'^[\u0621-\u064A a-zA-Z]+$');
    if (!nameRegExp.hasMatch(val)) {
      return "الاسم يجب أن يحتوي على حروف عربية أو إنجليزية فقط";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "رجاءأضافه البريد الالكتروني";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "  هذا الحقل مطلوب";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "  هذا الحقل مطلوب";
    }
  }
  if (val.isEmpty) {
    return "لايمكن ان يكون الحقل فارغ";
  }

  if (val.length < min) {
    return "لايمكن ان يكون أقل  $min";
  }
  if (val.length > max) {
    return "لايمكن ان يكون أكثر $max";
  }
}
