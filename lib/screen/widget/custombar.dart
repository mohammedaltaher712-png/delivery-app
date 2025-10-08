import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Custombar extends StatelessWidget {
  const Custombar({
    super.key,
    this.onPressed,
    required this.Iconsdata,
    required this.URLImages,
  });
  final void Function()? onPressed;
  final Icon Iconsdata;
  final String URLImages;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: onPressed, icon: Iconsdata),

        Image.asset(URLImages, fit: BoxFit.cover, height: 50),
      ],
    );
  }
}
