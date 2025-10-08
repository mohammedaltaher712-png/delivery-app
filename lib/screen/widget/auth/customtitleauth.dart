import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtitleauth extends StatelessWidget {
  const Customtitleauth({
    super.key,
    required this.titleone,
    required this.titletow,
  });

  final String titleone;
  final String titletow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            titleone,
            style: TextStyle(color: Appcolors.orange, fontSize: 40),
          ),
          SizedBox(height: 18),
          Text(
            titletow,
            style: TextStyle(color: Appcolors.orange, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
