// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:order_delivery_application/Linkapi.dart';
// import 'package:order_delivery_application/controller/categoires_controller.dart';
// import 'package:order_delivery_application/core/class/handlingdataview.dart';
// import 'package:order_delivery_application/core/constant/AppColors.dart';
// import 'package:order_delivery_application/core/functions/ordersdetilsdelivery.dart';
// import 'package:order_delivery_application/data/model/serivecsmodel.dart';
// import 'package:order_delivery_application/data/model/serivecswithcategorymodel.dart';

// class Customcardserivecswithcategory extends StatelessWidget {
//   const Customcardserivecswithcategory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CategoiresController>(
//       builder:
//           (controller) => HandlingDataView(
//             statusRequest: controller.statusRequestServices,
//             widget: SizedBox(
//               height: Get.height / 2,
//               child: ListView.builder(
//                 itemCount: controller.itemscate.length,
//                 itemBuilder: (context, index) {
//                   return card(
//                     i: index,
//                     serivecswithcategoryModel: controller.itemscate[index],
//                   );
//                 },
//               ),
//             ),
//           ),
//     );
//   }
// }

// class card extends GetView<CategoiresController> {
//   const card({
//     super.key,
//     required this.i,
//     required this.serivecswithcategoryModel,
//   });
//   final int? i;
//   final SerivecswithcategoryModel serivecswithcategoryModel;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.gotipage(serivecswithcategoryModel);
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           side: BorderSide(width: 1, color: Appcolors.black),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         elevation: 4,
//         margin: EdgeInsets.all(12),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,

//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: CachedNetworkImage(
//                     imageUrl:
//                         "${Linkapi.Servicesimage}/${serivecswithcategoryModel.servicesImage}",
//                     height: 130,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(12),

//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,

//                     children: [
//                       Text(
//                         "${serivecswithcategoryModel.servicesName}",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "${serivecswithcategoryModel.servicesDescription}",
//                         style: TextStyle(color: Colors.grey[700], fontSize: 12),
//                       ),
//                       SizedBox(height: 6),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Icon(Icons.star, color: Appcolors.orange, size: 18),
//                           SizedBox(width: 4),
//                           // Text(
//                           //   "${menuModel.itemsRating}",
//                           //   style: TextStyle(fontSize: 14),
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             Positioned(
//               top: 5,
//               right: 5,
//               child: Container(
//                 width: Get.width / 3.2,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "45-30 دقيقة",
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Icon(Icons.timer, color: Colors.red, size: 18),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 50,
//               right: 20,
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(width: 2, color: Appcolors.orange),
//                     ),
//                     height: 100,
//                     width: Get.width / 4,
//                     child: CachedNetworkImage(
//                       imageUrl:
//                           "${Linkapi.Servicesicons}/${serivecswithcategoryModel.servicesIcon}",
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Positioned(
//                     child: Container(
//                       width: 100,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color:
//                             serivecswithcategoryModel.servicesStatus == 1
//                                 ? Colors.green
//                                 : Colors.red,

//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         printstatus(
//                           serivecswithcategoryModel.servicesStatus.toString(),
//                         ),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
