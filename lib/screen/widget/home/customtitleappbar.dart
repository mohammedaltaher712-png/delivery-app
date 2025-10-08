import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtitleappbar extends StatelessWidget {
  const Customtitleappbar({
    super.key,
    required this.title,
    this.onTap,
    required this.URLImages,
    this.onTapadd,
    required this.titleadd,
  });
  final String title;
  final void Function()? onTap;
  final String URLImages;
  final void Function()? onTapadd;
  final String titleadd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTapadd,
          child: Column(
            children: [
              Container(
                width: 25, // القطر
                height: 25,
                decoration: BoxDecoration(
                  color: Appcolors.Lsitca, // خلفية سوداء
                  shape: BoxShape.circle, // شكل دائري
                ),
                child: ClipOval(
                  child: Image.asset(URLImages, fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 5),
              Text(
                titleadd,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 100),
            padding: EdgeInsets.all(5),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Appcolors.Lsitca),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Appcolors.Lsitca,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
