import 'package:flutter/material.dart';

class GeneralAppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final String family;
  final FontStyle style;

  GeneralAppText(
      {@required this.text,
      this.size,
      this.color,
      this.weight,
      this.family,
      this.style});

  @override
  Widget build(BuildContext context) {
    final _scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 20 * _scaleFactor,
        fontWeight: weight ?? FontWeight.w600,
        fontFamily: family ?? 'Cambria',
        fontStyle: style ?? FontStyle.italic,
      ),
    );
  }
}
