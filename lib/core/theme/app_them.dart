import 'package:flutter/material.dart';
import 'package:users_todo/core/color/app_colors.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  primaryColor: Colors.amber,
  secondaryHeaderColor: Colors.amber,
  fontFamily: 'Lato',
  textTheme: const TextTheme(
    headline1: TextStyle(
        height: 3,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColor.secanderyColor),
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
        color: AppColor.iconsColor),

    headline4: TextStyle(
        height: 2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black26),
  ),
  primarySwatch: Colors.blue,
);
