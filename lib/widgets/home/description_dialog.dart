import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/models/task.dart';
import 'package:task_manager_with_xd/widgets/error_widget.dart';

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
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.044),
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
