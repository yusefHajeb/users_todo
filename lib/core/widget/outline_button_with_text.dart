import 'package:flutter/material.dart';

import '../color/app_colors2.dart';

class OutlinedButtonWithText extends StatelessWidget {
  final String content;

  final VoidCallback? onPressed;

  const OutlinedButtonWithText(
      {Key? key, required this.content, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: width,
        height: 40,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(HexColor.fromHex("181A1F")),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(
                            color: HexColor.fromHex("246EFE"), width: 2)))),
            child: Center(
                child: Text(content,
                    style: TextStyle(fontSize: 17, color: Colors.white)))));
  }
}
