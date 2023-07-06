import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/color/app_colors2.dart';

class SubmitFormBtn extends StatelessWidget {
  final void Function() onPressed;
  final bool update;
  const SubmitFormBtn({Key? key, required this.onPressed, required this.update})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 100,
        onPressed: onPressed,
        color: AppColors.primaryAccentColor,
        child: Row(
          children: [
            Icon(FontAwesomeIcons.add,
                size: 15, color: HexColor.fromHex("C395FC")),
            SizedBox(
              width: 20,
            ),
            Text(
              update ? "Update" : "Add",
              style: TextStyle(color: AppColors.primaryBackgroundColor),
            )
          ],
        ));
  }
}
