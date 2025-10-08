import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtitlepage extends StatelessWidget {
  const Customtitlepage({super.key, required this.title1, required this.title2});
  final String title1;
    final String title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
        title1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Appcolors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
         title2,
          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
