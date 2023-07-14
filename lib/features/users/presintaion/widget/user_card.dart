import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

import '../../../../core/color/app_colors2.dart';

class UserCurd extends StatelessWidget {
  final Users user;
  const UserCurd({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.pink.withAlpha(0),
            AppColors.lightMauveBackgroundColor
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(width: 1, color: Colors.white),
      ),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: HexColor.fromHex("181A1F")),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: HexColor.fromHex("5A5E6D"),
                      radius: 19,
                      child: Container(
                          padding: EdgeInsets.all(7),
                          width: 40 * 0.8,
                          height: 40 * 0.8,
                          decoration: BoxDecoration(
                              color: AppColors.lightMauveBackgroundColor
                                  .withOpacity(1),
                              shape: BoxShape.circle),
                          child: Text(
                            user.id.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontWeight: FontWeight.bold),
                          )),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name.toString(),
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.2)),
                          SizedBox(height: 4),
                          Text(user.email.toString(),
                              style: GoogleFonts.lato(
                                  color: HexColor.fromHex("5A5E6D")))
                        ])
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
