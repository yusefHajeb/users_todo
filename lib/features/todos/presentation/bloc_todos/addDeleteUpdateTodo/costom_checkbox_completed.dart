import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CostomCheckboxCompleted extends StatelessWidget {
  final bool completed;
  CostomCheckboxCompleted({Key? key, required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: completed ? Colors.green : Colors.grey, width: 2.1),
        color: completed ? Colors.green : Colors.transparent,
      ),
      child: completed
          ? Icon(
              FontAwesomeIcons.check,
              size: 16.2,
              color: Colors.white,
            )
          : null,
    );
  }
}
