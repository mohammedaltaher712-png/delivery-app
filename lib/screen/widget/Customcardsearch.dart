import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/Linkapi.dart';
import 'package:order_delivery_application/controller/homebanner_controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/serivecsmodel.dart'
    show SerivecsModel;

class ListItemsSearch extends GetView<HomebannerController> {
  final List<SerivecsModel> Serivcesmodle;

  const ListItemsSearch({super.key, required this.Serivcesmodle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Serivcesmodle.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final service = Serivcesmodle[index];

        return InkWell(
          onTap: () {
            controller.gotipage(service);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Linkapi.Servicesicons}/${service.servicesIcon}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) =>
                            Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) =>
                            Icon(Icons.error, color: Colors.red),
                  ),
                ),

                // Details
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.servicesName ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.black,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          service.categoryName ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
