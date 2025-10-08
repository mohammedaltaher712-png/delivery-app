import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.icon,
    required this.text,
    this.highlight = false, // ✅ الآن يمكن تمريره من الخارج
  });

  final IconData icon;
  final String text;
  final bool highlight; // ✅ أصبح قابل للتمرير

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: highlight ? Appcolors.orange : Colors.black54),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
            color: highlight ? Appcolors.orange : Colors.black87,
          ),
        ),
      ],
    );
  }
}
