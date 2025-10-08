import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtextbowm extends StatelessWidget {
  const Customtextbowm({
    super.key,
    this.onTap,
    required this.title,
    required this.title1,
  });
  final void Function()? onTap;
  final String title;
  final String title1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontSize: 14)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title1,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Appcolors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
