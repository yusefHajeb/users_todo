import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/app_colors2.dart';
import 'button_back_with_icon.dart';

class HeaderApp extends StatelessWidget {
  final String title;
  final bool? messagingPage;
  final Widget? widget;
  const HeaderApp(
      {Key? key, this.widget, required this.title, this.messagingPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const RoundedBorderWithIcon(icon: Icons.arrow_back),
      (messagingPage != null)
          ? Row(children: [
              Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor.fromHex("94D57B"))),
              SizedBox(width: 5),
              Text(this.title,
                  style: GoogleFonts.lato(fontSize: 20, color: Colors.white))
            ])
          : Text(this.title,
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
      widget!
    ]);
  }
}
