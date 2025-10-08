import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery_application/controller/Invoice_controller.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customcommentscontainer extends StatelessWidget {
  const Customcommentscontainer({
    super.key,
    required this.title1,
    required this.title2,
    this.controller,
  });
  final String title1;
  final String title2;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Appcolors.orange, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Appcolors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.description, color: Appcolors.Lsitca),
              ),
              SizedBox(width: 10),
              Text(
                title1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Appcolors.black,
                ),
              ),
            ],
          ),

          Divider(color: Appcolors.orange, thickness: 1, height: 20),

          SizedBox(
            height: 150,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                maintainHintHeight: true,
                contentPadding: EdgeInsets.all(5),
                hintText: title2,
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 19),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
