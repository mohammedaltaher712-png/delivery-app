import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:order_delivery_application/controller/OrderHistory_Controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
}

fcmconfig() {
  print("hai =======================================================");
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification =================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(
      message.notification!.title!,
      message.notification!.body!,
      backgroundColor: Appcolors.Lsitca,
      colorText: Appcolors.black,
    );
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("============================= page id ");
  print(data['pageid']);
  print("============================= page name ");
  print(data['pagename']);
  print("================== Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/OrderHistory" &&
      data['pagename'] == "refreshorderpending") {
    OrderhistoryController controller = Get.find();
    controller. intialData();
  }
}


// Firebase + stream 
// Socket io 
// Notification refresh 