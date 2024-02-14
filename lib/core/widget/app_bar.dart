import 'package:flutter/material.dart';
import 'package:users_todo/core/Util/extentions.dart';
import 'package:users_todo/core/color/app_colors2.dart';

//immport function in  appBar
AppBar buildAppBar(BuildContext context, String title,
    {bool arrowBack = false}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: HexColor.fromHex("#181a1f"),
    elevation: 0.0,
    leading: arrowBack
        ? IconButton(
            onPressed: () {
              context.navigator.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          )
        : null,
    title: Text(
      title,
      style: context.textTheme.bodyLarge?.copyWith(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
