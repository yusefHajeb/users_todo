import 'package:flutter/material.dart';
import 'package:users_todo/core/color/app_colors.dart';
import 'package:users_todo/core/color/app_colors2.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  primaryColor: AppColors.primaryBackgroundColor,
  secondaryHeaderColor: AppColors.primaryAccentColor,
  fontFamily: 'Lato',
  textTheme: TextTheme(
    headline1: TextStyle(
      height: 3,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: HexColor.fromHex("87C76F"),
    ),
    // textAlign: TextAlign.center,
    headline2: TextStyle(
        height: 1, fontSize: 16, color: Color.fromARGB(255, 72, 75, 77)
        // fontWeight: FontWeight.bold,
        ),
    headline3: TextStyle(
        fontFamily: 'Cairo',
        height: 2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: HexColor.fromHex("3C3E49")),

    headline4: TextStyle(
        height: 2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black26),
  ),
  primarySwatch: Colors.blue,
);
