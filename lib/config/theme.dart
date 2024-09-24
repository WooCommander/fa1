import 'package:flutter/material.dart';

// Основные цвета приложения
class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black87;
}

// Темы приложения
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle( // Ранее headline1
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
      bodyLarge: TextStyle( // Ранее bodyText1
        fontSize: 18.0,
        color: AppColors.textColor,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
  );
}
