import 'package:flutter/material.dart';

class IncreaseDecreaseArrow extends StatelessWidget {

  final Function(int) onTapped;
  final flag;

  IncreaseDecreaseArrow({@required this.onTapped, this.flag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped(flag == "f" ? (-1) : (1)),
      child: Container(
        width: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.height / 25,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.height / 25),
          border: Border.all(width: 2.0, color: Colors.white),
        ),
        padding: EdgeInsets.symmetric(horizontal: flag == "f" ? 8 : 10),
        child: Icon(
            flag == "f" ? Icons.arrow_back_ios_outlined : Icons.arrow_forward_ios,
            color: Colors.white,
            size: MediaQuery.of(context).size.width / 22),
      ),
    );
  }
}
