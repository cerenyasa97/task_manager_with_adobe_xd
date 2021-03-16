import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';
import 'package:task_manager_with_xd/utils/constants.dart';

class DateCards extends StatelessWidget {
  final int monthIndex;
  int tappedIndex;
  final Function(int) onChange;

  DateCards(
      {@required this.monthIndex,
      @required this.tappedIndex,
      @required this.onChange});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return Container(
        height: height * 0.11,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Constants.monthsDayLength[monthIndex],
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                tappedIndex = index;
                onChange(index);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: width * 0.13,
                decoration: BoxDecoration(
                  color: tappedIndex == index
                      ? const Color(0xff5d6798)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(27.0),
                  border:
                      Border.all(width: 3.0, color: const Color(0xff5d6798)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GeneralAppText(
                      text: (index + 1).toString(),
                      size: 17,
                      color: index == tappedIndex
                          ? Colors.white
                          : const Color(0xff5d6798),
                    ),
                    GeneralAppText(
                      text: DateTime.parse(DateTime.now().year.toString() +
                              "-" +
                              (monthIndex < 9
                                  ? "0${monthIndex + 1}"
                                  : "${monthIndex + 1}") +
                              "-" +
                              (DateTime.now().day + index - 1 < 10
                                  ? "0${DateTime.now().day + index - 1}"
                                  : "${DateTime.now().day + index - 1}"))
                          .format("D"),
                      size: 15,
                      weight: FontWeight.bold,
                      color: index == tappedIndex
                          ? Colors.white
                          : const Color(0xff5d6798),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
