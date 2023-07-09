import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Values/app_space.dart';
import '../color/app_colors2.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Container(
            padding: EdgeInsets.only(left: 20),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                color: AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Transform.rotate(
                angle: 195.2,
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.primaryAccentColor,
                        shape: BoxShape.circle),
                    child:
                        Icon(Icons.attach_file, color: Colors.white, size: 30)),
              ),
              AppSpaces.horizontalSpace20,
              Text(message, style: GoogleFonts.lato(color: Colors.white))
            ]))));
  }
}
