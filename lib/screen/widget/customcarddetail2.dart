// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:order_delivery_application/Linkapi.dart';
// import 'package:order_delivery_application/controller/Detail_controller.dart';
// import 'package:order_delivery_application/core/class/handlingdataview.dart';
// import 'package:order_delivery_application/core/constant/AppColors.dart';
// import 'package:order_delivery_application/data/model/list_detaismodel.dart';

// class Customcardsetail2 extends StatelessWidget {
//   const Customcardsetail2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<DetailController>(
//       builder:
//           (controller) => HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: SliverList(
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 return cards(
//                   i: index,
//                   menuDetailModel: controller.list_detai_menus[index],
//                 );
//               }, childCount: controller.list_detai_menus.length),
//             ),
//           ),
//     );
//   }
// }

// class cards extends GetView<DetailController> {
//   const cards({super.key, required this.i, required this.menuDetailModel});
//   final int? i;
//   final MenuDetailModel menuDetailModel;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // controller.gotipage(serviceitemsviewModel);
//       },
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: BorderSide(color: Appcolors.black.withOpacity(0.2), width: 1),
//         ),
//         elevation: 6,
//         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: CachedNetworkImage(
//                   imageUrl:
//                       "${Linkapi.menudetailsimage}/${menuDetailModel.menuDetailsImage}",
//                   height: 80,
//                   width: 80,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${menuDetailModel.menuDetailsName}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: Appcolors.orange,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       "${menuDetailModel.menuDetailsPrice} ريال",
//                       style: TextStyle(color: Colors.grey[700], fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 40,
//                 width: Get.width / 6,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(width: 1, color: Appcolors.orange),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         // controller.gotipage(serviceitemsviewModel);
//                       },
//                       icon: Icon(Icons.add),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
