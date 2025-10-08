// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotel/core/constant/AppImages.dart';

// import 'package:rating_dialog/rating_dialog.dart';

// // show the dialog
// showrating(BuildContext context, String itemsId) {
//   showDialog(
//     context: context,
//     barrierDismissible: true, // set to false if you want to force a rating
//     builder: (context) => RatingDialog(
//       initialRating: 1.0,
//       // your app's name?
//       title: Text(
//         'Rating Dialog',
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       // encourage your user to leave a high rating?
//       message: Text(
//         'Tap a star to set your rating. Add more description here if you want.',
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 15),
//       ),
//       // your app's logo?
//       image: Image.asset(Appimages.rating),
//       submitButtonText: 'Submit',
//       commentHint: 'Set your custom comment hint',
//       onCancelled: () => print('cancelled'),
//       onSubmitted: (response) {
//         CartController controllerca = Get.put(CartController());
//         controllerca.sumitRating(itemsId, response.rating, response.comment);
//         // OrdersArchiveController controller = Get.find();
//         // controller.sumitRating(ordersid, response.rating, response.comment);
//         print('rating: ${response.rating}, comment: ${response.comment}');
//       },
//     ),
//   );
// }
