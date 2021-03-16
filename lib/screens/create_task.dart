import 'package:flutter/material.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';
import 'package:task_manager_with_xd/models/task.dart';
import 'package:task_manager_with_xd/widgets/create_task/create_task_body.dart';
import 'package:task_manager_with_xd/widgets/task_background.dart';

class CreateTask extends StatelessWidget {
  final Task updateTask;

  CreateTask({this.updateTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color(0xff5d6798)),
        backgroundColor: Colors.white,
        elevation: 1,
        title: GeneralAppText(
            text: "Create Task",
            size: 25,
            color: const Color(0xff5d6798),
            weight: FontWeight.bold),
      ),
      body: Stack(
        children: [
          TaskBackground(),
          CreateTaskBody(
            updateTask: updateTask,
          ),
        ],
      ),
    );
  }
}
