import 'package:flutter/material.dart';

class MessageSnackBar {
  void showMessageSnackBar(String message, BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(backgroundColor: color),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

TextTheme myTheme(BuildContext ctx) {
  return Theme.of(ctx).textTheme;
}
