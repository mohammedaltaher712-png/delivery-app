String printOrderStatus(String val) {
  if (val == "0") {
    return "ملغي ";
  } else if (val == "1") {
    return "تحت المرجعة ";
  } else if (val == "2") {
    return " جاري التحضير";
  } else if (val == "3") {
    return "في الطريق";
  } else {
    return "تم التوصيل";
  }
}

String printOrderType(String val) {
  if (val == "0") {
    return "delivery";
  } else {
    return "Recive";
  }
}

String printPaymentMethod(String val) {
  if (val == "0") {
    return "Cash On Delivery";
  } else {
    return "Payment Card";
  }
}

String printstatus(String val) {
  if (val == "0") {
    return " مغلق ";
  } else {
    return " مفتوح";
  }
}
