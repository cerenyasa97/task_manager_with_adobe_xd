
// Homepage body structure
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/widgets/home/bottom_buttons.dart';
import 'package:task_manager_with_xd/widgets/home/choose_month.dart';
import 'package:task_manager_with_xd/widgets/home/date_cards.dart';
import 'package:task_manager_with_xd/widgets/home/home_bottom_widget.dart';

class HomepageBody extends StatefulWidget {
  final BuildContext context;
  final String date;

  HomepageBody({@required this.context, @required this.date});

  @override
  _HomepageBodyState createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  int monthIndex = DateTime.now().month - 1;
  int tappedIndex = 35;

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(GetTasksEvent(date: widget.date));
    return Column(
      children: [
        ChooseMonth(choosenMonth: (int monthIndex) {
          setState(() {
            this.monthIndex = monthIndex;
          });
        }),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        DateCards(
          onChange: (int index) {
            tappedIndex = index;
            BlocProvider.of<TaskBloc>(context).add(GetTasksEvent(
                date: DateTime.now().year.toString() +
                    "-" +
                    (monthIndex < 9
                        ? "0${monthIndex + 1}"
                        : "${monthIndex + 1}") +
                    "-" +
                    (index + 1 < 10 ? "0${index + 1}" : "${index + 1}")));
          },
          tappedIndex: tappedIndex,
          monthIndex: monthIndex,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Expanded(
          child: Stack(
            children: [
              HomeBottomWidget(
                date: widget.date,
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 68,
                left: MediaQuery.of(context).size.width / 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomButtons(
                        onTap: () {
                          taskBloc
                              .add(GetTasksEvent(date: "getLast", isDone: 1));
                        },
                        buttonIcon: Icons.done),
                    BottomButtons(
                        onTap: () {
                          taskBloc
                              .add(GetTasksEvent(date: "getLast", isDone: 0));
                        },
                        buttonIcon: Icons.close),
                    BottomButtons(
                        onTap: () {
                          setState(() {
                            tappedIndex = 35;
                          });
                        },
                        buttonIcon: Icons.all_inclusive),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
