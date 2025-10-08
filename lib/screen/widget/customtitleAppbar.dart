import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';

class CustomTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTitleAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black), // <-- هذا السطر

      backgroundColor: Appcolors.Lsitca,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Appcolors.black,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            Appimages.logo,
            width: 40,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  // هذا الجزء مهم لتحديد حجم الـ AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
