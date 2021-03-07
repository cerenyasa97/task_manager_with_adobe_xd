import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/models/task.dart';
import 'package:task_manager_with_xd/screens/create_task.dart';
import 'package:task_manager_with_xd/widgets/home/alert_button_design.dart';

class AlertDialogButtons extends StatelessWidget {
  final int index;

  AlertDialogButtons({@required this.index});

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    return Row(
      children: [
        AlertButtonDesign(
            icon: Icons.update,
            index: index,
            onTap: (Task task) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => CreateTask(
                        updateTask: task,
                      )));
            }),
        AlertButtonDesign(
            icon: Icons.delete,
            index: index,
            onTap: (Task task) {
              taskBloc.add(DeleteTaskWithIDEvent(taskID: task.taskID));
              taskBloc.add(GetTasksEvent(
                date: "all",
              ));
              Navigator.of(context).pop();
            }),
        AlertButtonDesign(
            icon: Icons.done,
            index: index,
            onTap: (Task task) {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
