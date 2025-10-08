import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Custombanner extends StatelessWidget {
  const Custombanner({super.key, required this.urlimage});
  final String urlimage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 6),
              blurRadius: 12,
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: urlimage,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
