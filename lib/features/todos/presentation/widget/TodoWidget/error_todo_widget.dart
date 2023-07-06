import 'package:flutter/material.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
          child: Text(
        message,
        style: TextStyle(fontSize: 12),
      )),
    );
  }
}
