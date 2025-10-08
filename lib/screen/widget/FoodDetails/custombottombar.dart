import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Custombottombar extends StatelessWidget {
  const Custombottombar({
    super.key,
    this.onPressedcard,
    required this.title2,
    required this.icons,
    required this.title3,
    this.onTap,
  });
  final void Function()? onPressedcard;

  final String title2;
  final String title3;

  final IconData icons;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Appcolors.orange,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Appcolors.grey.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  title3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Icon(icons, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
