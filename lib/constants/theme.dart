import 'colors.dart';
import 'package:flutter/material.dart';

class ProjectTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      background: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: kBlackColor,
        fontSize: 22,
      ),
      titleMedium: TextStyle(
        color: kBlackColor,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: kBlackColor,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        color: kOnGreyColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: kOnGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        color: kBottomBarIconColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 76,
      centerTitle: true,
      iconTheme: const IconThemeData(color: kBlackColor),
      titleTextStyle: TextStyle(
        color: kBlackColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  );
}
