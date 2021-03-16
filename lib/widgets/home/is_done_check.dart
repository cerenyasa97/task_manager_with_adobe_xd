import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';

// Structure showing the completion status of the task
class IsDoneCheck extends StatefulWidget {
  final index;

  IsDoneCheck({@required this.index});

  @override
  _IsDoneCheckState createState() => _IsDoneCheckState();
}

class _IsDoneCheckState extends State<IsDoneCheck> {
  int checkedValue;
  Color color;

  @override
  Widget build(BuildContext context) {
    TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return InkWell(
        onTap: () {
          (taskBloc.state as GetTaskState).taskList[widget.index].isDone =
              (taskBloc.state as GetTaskState).taskList[widget.index].isDone ==
                      0
                  ? 1
                  : 0;
          taskBloc.add(UpdateTaskEvent(
              task: (taskBloc.state as GetTaskState).taskList[widget.index]));
          taskBloc.add(GetTasksEvent(date: "getLast"));
        },
        child: Container(
          width: 23.0,
          height: 23.0,
          decoration: BoxDecoration(
            color: (taskBloc.state as GetTaskState)
                        .taskList[widget.index]
                        .isDone ==
                    0
                ? null
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            border: Border.all(width: 3.0, color: const Color(0xfffcfcfe)),
          ),
        ),
      );
    });
  }
}

/*
CircularCheckBox(
              value: (taskBloc.state as GetTaskState).taskList[widget.index].isDone == 0 ? false : true,
          activeColor: Colors.white,
          checkColor: Colors.white,
          inactiveColor: Colors.white,
          disabledColor: Colors.white,
          onChanged: (newValue) {
          (taskBloc.state as GetTaskState).taskList[widget.index].isDone = newValue ? 1 : 0;
          taskBloc.add(UpdateTaskEvent(task: (taskBloc.state as GetTaskState).taskList[widget.index]));
          taskBloc.add(GetTasksEvent(date: "getLast"));
          });
          */
