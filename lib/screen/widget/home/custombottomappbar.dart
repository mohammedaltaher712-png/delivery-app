import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/screen/widget/home/custombottomInnavigationbar.dart';

class Custombottomappbar extends StatelessWidget {
  const Custombottomappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Appcolors.orange, width: 2)),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Custombottominnavigationbar(
              title: "الرئيسية",
              IconData: Icons.home,
              onPressed: () {},
            ),
            Custombottominnavigationbar(
              title: "البقالة",
              IconData: Icons.store,
              onPressed: () {},
            ),
            Custombottominnavigationbar(
              title: "طلباتي",
              IconData: Icons.list_alt,
              onPressed: () {},
            ),

            Custombottominnavigationbar(
              title: "مفضلتي",
              IconData: Icons.favorite_border,
              onPressed: () {},
            ),
            Custombottominnavigationbar(
              title: "حسابي",
              IconData: Icons.person_2_outlined,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
