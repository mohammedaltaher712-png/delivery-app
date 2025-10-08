import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customcardhead extends StatelessWidget {
  const Customcardhead({super.key, required this.title1, required this.title2, required this.title3, required this.title4, required this.iconstime, required this.iconsstar, required this.URLImages});
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final IconData iconstime;
    final IconData iconsstar;
  final String URLImages;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      shadowColor: Colors.orange.withOpacity(0.3),
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  title1,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                   title2,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Icon(
                       iconstime,
                        size: 20,
                        color: Appcolors.orange,
                      ),
                      SizedBox(width: 6),
                      Text(
                       title3,
                        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                      ),
                      Spacer(),
                      Icon(iconsstar, size: 20, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(title4, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl:
                 URLImages  ,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
