import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskTextField extends StatefulWidget {

  final Function(String) onChanged;
  final double  height;
  final double radius;
  final int maxLine;
  final double marginWidth;
  final String initialText;

  TaskTextField({Key key, @required this.onChanged, @required this.height, this.radius, this.maxLine, @required this.marginWidth, this.initialText}) : super(key: key);

  @override
  _TaskTextFieldState createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.text = widget.initialText ?? "";
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final List<BoxShadow> shadow = [
    BoxShadow(
      color: const Color(0x4fffffff),
      offset: Offset(0, 0),
      blurRadius: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width / 20,),
      margin: EdgeInsets.symmetric(horizontal: widget.marginWidth),
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius ?? 18.0),
        color: const Color(0xffcecece),
        boxShadow: shadow
      ),
      child: TextFormField(
        controller: controller,
        maxLines: widget.maxLine ?? 1,
        decoration: InputDecoration(
          border: InputBorder.none
        ),
        onChanged: (text) => widget.onChanged(text),
      ),
    );
  }
}
