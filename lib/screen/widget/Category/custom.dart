import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Custom extends StatelessWidget {
  const Custom({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Appcolors.black,
          ),
        ),
      ),
    );
  }
}
