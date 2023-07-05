import 'package:flutter/material.dart';
import 'package:users_todo/core/theme/app_them.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:equatable/equatable.dart';
// import 'package:users_todo/core/theme/app_them.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
        ),
        body: Center(
          child: Text("Todos page"),
        ),
      ),
    );
  }
}
