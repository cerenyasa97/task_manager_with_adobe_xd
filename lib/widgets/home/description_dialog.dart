import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/error_widget.dart';

import 'alert_dialog_buttons.dart';

class DescriptionDialog extends StatelessWidget {
  final int index;

  DescriptionDialog({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      if (state is GetTaskState) {
        final List<Task> taskList = (state).taskList;
        return AlertDialog(
          title: Text(taskList[index].taskTitle ?? "Alert"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xffe8e8e8),
          content: Text(taskList[index].taskDescription ?? "error"),
          actions: [AlertDialogButtons(index: index)],
        );
      } else {
        return TaskErrorWidget();
      }
    });
  }
}
