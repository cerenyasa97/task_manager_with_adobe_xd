import 'package:flutter/material.dart';

class TaskCreateSeparator extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const TaskCreateSeparator({Key key, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 1,
      color: color ?? Colors.white,
    );
  }
}
