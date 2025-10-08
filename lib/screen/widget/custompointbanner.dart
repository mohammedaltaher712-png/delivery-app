import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class CustomPointBanner extends StatelessWidget {
  const CustomPointBanner({super.key, required this.isActive});
    final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 10 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Appcolors.orange : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
