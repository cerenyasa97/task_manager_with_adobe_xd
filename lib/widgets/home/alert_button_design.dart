import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/models/task.dart';

// ignore: must_be_immutable
class AlertButtonDesign extends StatelessWidget {
  final Function(Task) onTap;
  final IconData icon;
  final int index;
  Task updateTask;

  AlertButtonDesign(
      {@required this.onTap, @required this.index, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      updateTask = (state as GetTaskState).taskList[index];
      return InkWell(
        splashColor: const Color(0xffe22a2a).withOpacity(0.1),
        onTap: () => onTap(updateTask),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 40,
              vertical: MediaQuery.of(context).size.height / 100),
          width: 50.0,
          height: 50.0,
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 0.58),
              colors: [const Color(0xfff89d00), const Color(0xffe22a2a)],
              stops: [0.0, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0x87ffffff),
                offset: Offset(0, 3),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      );
    });
  }
}
