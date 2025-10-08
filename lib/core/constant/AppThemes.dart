import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

// ThemeData themeEnglish = ThemeData(
//   fontFamily: "PlayfairDisplay",
//   floatingActionButtonTheme:
//       const FloatingActionButtonThemeData(backgroundColor: Appcolors.black),
//   appBarTheme: const AppBarTheme(
//     centerTitle: true,
//     elevation: 0,
//     iconTheme: IconThemeData(color: Appcolors.orange),
//     titleTextStyle: TextStyle(
//         color: Appcolors.Lsitca,
//         fontWeight: FontWeight.bold,
//         fontFamily: "PlayfairDisplay",
//         fontSize: 25),
//     backgroundColor:Appcolors.ps,
//   ),
// );

ThemeData ThemeArabic = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Appcolors.Lsitca),
    backgroundColor: Appcolors.orange,
    toolbarTextStyle: TextStyle(fontFamily: "Changa"),
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: "Changa",
      color: Appcolors.Lsitca,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  fontFamily: "Changa",
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
