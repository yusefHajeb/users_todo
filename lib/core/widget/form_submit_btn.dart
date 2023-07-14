import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/app_colors2.dart';

class SubmitFormBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool update;
  const SubmitFormBtn({Key? key, required this.onPressed, required this.update})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(HexColor.fromHex("246CFE")),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: HexColor.fromHex("246CFE"))))),
        child: Text(update ? "Update" : "Add",
            style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)));

    //  MaterialButton(
    //     minWidth: 100,
    //     onPressed: onPressed,
    //     color: AppColors.primaryAccentColor,
    //     child: Row(
    //       children: [
    //         Icon(FontAwesomeIcons.add,
    //             size: 15, color: HexColor.fromHex("C395FC")),
    //         SizedBox(
    //           width: 20,
    //         ),
    //         Text(
    //           update ? "Update" : "Add",
    //           style: TextStyle(color: AppColors.primaryBackgroundColor),
    //         )
    //       ],
    //     ));
  }
}
