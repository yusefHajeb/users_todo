import 'package:flutter/material.dart';
import 'package:users_todo/core/color/app_colors2.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  primaryColor: AppColors.primaryBackgroundColor,
  secondaryHeaderColor: AppColors.primaryAccentColor,
  fontFamily: 'Lato',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      height: 3,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: HexColor.fromHex("87C76F"),
    ),
    displayMedium: const TextStyle(
      height: 1,
      fontSize: 16,
      color: Color.fromARGB(255, 72, 75, 77),
    ),
    displaySmall: TextStyle(
        fontFamily: 'Cairo',
        height: 2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: HexColor.fromHex("3C3E49")),
    headlineMedium: const TextStyle(
        height: 2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black26),
  ),
  primarySwatch: Colors.blue,
);
