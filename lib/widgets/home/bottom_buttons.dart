import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';

class BottomButtons extends StatelessWidget {
  final Function() onTap;
  final IconData buttonIcon;

  BottomButtons({@required this.onTap, @required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          gradient: LinearGradient(
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [const Color(0xffe8e8e8), const Color(0xff979797)],
            stops: [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          buttonIcon,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
