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
        width: MediaQuery.of(context).size.width * 0.34,
        height: MediaQuery.of(context).size.height * 0.088,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: LinearGradient(
            begin: Alignment(0.7, -0.76),
            end: Alignment(-0.68, 0.72),
            colors: [const Color(0xfff89d00), const Color(0xffe22a2a)],
            stops: [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x42f89d00),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(child: GeneralAppText(text: "Save", size: 25,),),
      ),
    );
  }
}
