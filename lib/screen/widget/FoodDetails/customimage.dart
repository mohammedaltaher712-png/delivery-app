import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Customimage extends StatelessWidget {
  const Customimage({super.key, required this.UrlImge, this.tag});
  final String UrlImge;
    final dynamic tag;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          height: Get.height / 3,
          width: double.infinity,
          fit: BoxFit.cover,
          imageUrl:
             UrlImge,
          placeholder:
              (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget:
              (context, url, error) => Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}
