import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtitlestatus extends StatelessWidget {
  const Customtitlestatus({super.key, required this.title, required this.title1});
  final String title;
   final String title1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 6,
                spreadRadius: 5,
                color: Colors.green.withOpacity(0.4),
              ),
            ],
            borderRadius: BorderRadius.circular(10),

            color: Colors.green,
          ),
          child: Text(
            textAlign: TextAlign.center,
        title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          height: 70,

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 6,
                spreadRadius: 5,
                color: Colors.orange.withOpacity(0.2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(width: 1, color: Appcolors.orange),
          ),
          child: Text(
         title1,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
