import 'package:flutter/material.dart';

class AppTheme {
  //Color Palette
  static const Color primaryColor = Color(0xFF4B7BE5);
  static const Color successColor = Color(0xFF36AE7C);
  static const Color warningColor = Color(0xFFF9D923);
  static const Color dangerColor = Color(0xFFEB5353);
  static const Color defaultColor = Color(0xFFD9D9D9);
  static const Color appBackgroundColor = Color(0xFFEFEFF1);
  static const Color appInitialBackgroundColor = Color(0xFFFFFFFF);
  //Hover Color Palette
  static const Color primaryHoverColor = Color(0xFF436ECC);
  static const Color successHoverColor = Color(0xFF31986D);
  static const Color warningHoverColor = Color(0xFFDCC020);
  static const Color dangerHoverColor = Color(0xFFC74545);
  static const Color defaultHoverColor = Color(0xFF929292);

  static const Color defaultSnackBarColor = Color.fromARGB(255, 40, 40, 40);

  //Font Family
  static const String poppinsFontFamily = "Poppins";
  static const String logoFontFamily = "Sansation";

  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    primaryIconTheme: const IconThemeData(color: Colors.black),
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: poppinsFontFamily,
        ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appBackgroundColor,
      elevation: 0,
      toolbarHeight: 80,
    ),
    scaffoldBackgroundColor: appBackgroundColor,
  );
}
