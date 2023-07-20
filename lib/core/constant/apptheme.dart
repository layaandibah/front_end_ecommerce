import 'package:ecommers/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primarycolor),
    appBarTheme: const AppBarTheme(color: AppColor.primarycolor),
    fontFamily: "Cairo",
    backgroundColor: AppColor.wightpurble,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: AppColor.black),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          height: 2,
          color: AppColor.gray),
      bodyMedium: TextStyle(fontSize: 14, height: 2, color: AppColor.gray),
    ),);
ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: AppColor.black),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          height: 2,
          color: AppColor.gray),
      bodyMedium: TextStyle(fontSize: 14, height: 2, color: AppColor.gray),
    ));
