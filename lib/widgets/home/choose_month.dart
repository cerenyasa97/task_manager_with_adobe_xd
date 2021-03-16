import 'package:flutter/material.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';
import 'package:task_manager_with_xd/utils/constants.dart';
import 'package:task_manager_with_xd/widgets/home/increase_decrease_arrow.dart';

class ChooseMonth extends StatefulWidget {
  final Function(int) choosenMonth;

  ChooseMonth({@required this.choosenMonth});

  @override
  _ChooseMonthState createState() => _ChooseMonthState();
}

class _ChooseMonthState extends State<ChooseMonth> {
  int monthIndex = DateTime.now().month - 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IncreaseDecreaseArrow(
          flag: "f",
          onTapped: (int value) {
            setState(() {
              monthIndex > 0 ? monthIndex += value : monthIndex = 11;
            });
            widget.choosenMonth(monthIndex);
          },
        ),
        GeneralAppText(
          text: Constants.getCurrentMonth(monthIndex),
          color: const Color(0xff5d6798),
        ),
        IncreaseDecreaseArrow(
          flag: "d",
          onTapped: (int value) {
            setState(() {
              monthIndex < 11 ? monthIndex += value : monthIndex = 0;
              widget.choosenMonth(monthIndex);
            });
          },
        ),
      ],
    );
  }
}
