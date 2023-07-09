import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/core/widget/app_header_widget.dart';

import '../../../../core/DarckBackground/dark_background.dart';
import '../../../../core/Values/app_space.dart';
import '../../../../core/color/app_colors2.dart';
import '../../../../core/widget/outline_button_with_text.dart';
import '../../domain/entites/user_entity.dart';

class UserDetailsPage extends StatelessWidget {
  final Users user;
  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                HeaderApp(
                  title: "Details User",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user.name!,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
                Text(user.email.toString(),
                    style: GoogleFonts.lato(
                        color: HexColor.fromHex("B0FFE1"), fontSize: 17)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButtonWithText(
                      width: 75, content: "Edit", onPressed: () {}),
                ),
                AppSpaces.verticalSpace20,
              ],
            ))))
      ],
    );
  }
}
