import 'package:flutter/material.dart';

class AppColors {
  static const Color cream = Color(0xFFFFF8F1);
  static const Color coffee = Color(0xFF6F4E37);
  static const Color sage = Color(0xFFB2BFA3);
  static const Color orange = Color(0xFFFFA15F);
  static const Color dark = Color(0xFF2D2A26);
  static const Color light = Color(0xFFF5F5F5);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.coffee,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: ColorScheme.light(
        primary: AppColors.coffee,
        secondary: AppColors.orange,
        background: AppColors.cream,
        surface: AppColors.light,
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.coffee),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.dark),
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.dark),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.dark),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cream,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.coffee),
        titleTextStyle: TextStyle(color: AppColors.coffee, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.orange,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
} 