import 'package:flutter/material.dart';

class TaskBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Image.asset(
        "assets/images/background.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
