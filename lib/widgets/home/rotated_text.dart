import 'package:flutter/material.dart';

class RotatedText extends StatelessWidget {
  final String text;
  final String flag;

  RotatedText({@required this.text, @required this.flag});

  @override
  Widget build(BuildContext context) {
    final String digitControl = int.parse(text) < 10 ? text.split("0")[1].toString() : text;
    final double size = int.parse(text) < 10 ? 40 : 30;
    return RotatedBox(
      quarterTurns: flag == "start" ? -1 : 1,
      child: Text(digitControl, style: TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),),
    );
  }
}
