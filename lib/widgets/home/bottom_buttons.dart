import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final Function() onTap;
  final IconData buttonIcon;

  BottomButtons({@required this.onTap, @required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06),
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.height * 0.065,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          border: Border.all(width: 3.0, color: const Color(0xff767fae)),
        ),
        child: Icon(
          buttonIcon,
          color: const Color(0xff767fae),
          size: 30,
        ),
      ),
    );
  }
}
