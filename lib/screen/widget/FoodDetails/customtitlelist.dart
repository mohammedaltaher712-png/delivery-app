import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtitlelist extends StatelessWidget {
  const Customtitlelist({super.key, this.icon, required this.title1});
  final IconData? icon;
    final String title1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: Appcolors.orange, size: 22),
          SizedBox(width: 8),
          Text(
           title1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Appcolors.ColorText, // أو Appcolors.orange حسب ذوقك
            ),
          ),
        ],
      ),
    );
  }
}
