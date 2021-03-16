import 'package:flutter/material.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';

class CreateButton extends StatelessWidget {
  final Function() onPressed;

  const CreateButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 117.0,
        height: 51.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: LinearGradient(
            begin: Alignment(0.7, -0.76),
            end: Alignment(-0.68, 0.72),
            colors: [const Color(0xff5d6798), const Color(0xff767fae)],
            stops: [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff929ac2),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: GeneralAppText(
            text: "Save",
            style: FontStyle.normal,
            size: 25,
          ),
        ),
      ),
    );
  }
}
