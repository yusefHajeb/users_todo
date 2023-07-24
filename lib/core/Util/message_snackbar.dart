import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Values/app_space.dart';
import '../color/app_colors2.dart';
import '../error/failure.dart';
import '../strings/failure.dart';

class MessageSnackBar {
  void showMessageSnackBar(String message, BuildContext context, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Container(
              height: MediaQuery.of(context).size.height / 12,
              child: Container(
                  padding: EdgeInsets.only(left: 0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Transform.rotate(
                          angle: 195.2,
                          child: Container(
                              width: 40,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryAccentColor,
                                  shape: BoxShape.circle),
                              child: Icon(Icons.attach_file,
                                  color: Colors.white, size: 30)),
                        ),
                        AppSpaces.horizontalSpace20,
                        Text(message,
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 12))
                      ]))))),

      //   content: Text(message, style: Theme.of(context).textTheme.headline3),
      //   backgroundColor: color,
      // ),
    );
  }
}

TextTheme myTheme(BuildContext ctx) {
  return Theme.of(ctx).textTheme;
}
