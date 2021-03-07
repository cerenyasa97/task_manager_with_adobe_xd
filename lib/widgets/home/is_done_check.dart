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

  @override
  Widget build(BuildContext context) {
    TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return CircularCheckBox(
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
        }
    );
  }
}