import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/core/Util/extentions.dart';
import 'package:users_todo/core/Values/app_space.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

import '../../../../core/color/app_colors2.dart';

class UserCurd extends StatelessWidget {
  final Users user;
  const UserCurd({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: HexColor.fromHex("501A1F")),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: HexColor.fromHex("181A1F"),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color.fromARGB(255, 31, 7, 15),
                      // Colors.pink.withAlpha(0),
                      AppColors.lightMauveBackgroundColor,
                      HexColor.fromHex("181A1F"),
                    ]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: HexColor.fromHex("5A5E6D"),
                          radius: 18,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            width: 46 * 0.8,
                            height: 46 * 0.8,
                            decoration: BoxDecoration(
                              color: AppColors.lightMauveBackgroundColor
                                  .withOpacity(1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                user.id.toString(),
                                textAlign: TextAlign.center,
                                style: context.textTheme.displayMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        AppSpaces.horizontalSpace10,
                        Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.name.toString(),
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.2)),
                              const SizedBox(height: 4),
                              Text(user.email.toString(),
                                  style: GoogleFonts.lato(
                                      color: HexColor.fromHex("5A5E6D")))
                            ])
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
