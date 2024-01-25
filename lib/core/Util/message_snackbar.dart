import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/core/Util/extentions.dart';
import '../Values/app_space.dart';

class MessageSnackBar {
  void showMessageSnackBar(String message, BuildContext context, Color color) {
    context.scaffoldMessenger.showSnackBar(
      SnackBar(
        content: SizedBox(
          child: Container(
            padding: const EdgeInsets.only(left: 0),
            height: context.mediaQuery.size.height / 12,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 195.2,
                  child: Container(
                      width: 40,
                      height: 50,
                      decoration:
                          BoxDecoration(color: color, shape: BoxShape.circle),
                      child: const Icon(Icons.attach_file,
                          color: Colors.white, size: 30)),
                ),
                AppSpaces.horizontalSpace20,
                Text(
                  message,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextTheme myTheme(BuildContext ctx) {
  return Theme.of(ctx).textTheme;
}
