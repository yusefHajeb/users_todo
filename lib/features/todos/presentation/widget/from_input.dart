// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../../../core/Values/app_space.dart';
import '../../../../core/color/app_colors2.dart';

class LabelledFormInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? value;

  final TextEditingController controller;
  const LabelledFormInput({
    Key? key,
    required this.placeholder,
    required this.controller,
    required this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpaces.verticalSpace10,
        Text(
          label!.toUpperCase(),
          textAlign: TextAlign.left,
          style: myTheme.headline2!.copyWith(color: HexColor.fromHex("3C3E49")),
        ),
        TextFormField(
          controller: controller,
          style: myTheme.headline2!.copyWith(fontSize: 18, color: Colors.white),
          onTap: () {},
          validator: (val) => val!.isEmpty ? "$label Can/'t be empty" : null,
          //initialValue: initialValue,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              suffixIcon: _suffixWidget(),
              hintStyle: myTheme.headline2!
                  .copyWith(color: HexColor.fromHex("3C3E49")),
              filled: false,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")))),
        ),
      ],
    );
  }

  Widget _suffixWidget() {
    return InkWell(
      onTap: () {},
      child: Icon(FontAwesomeIcons.check),
    );
  }
}
