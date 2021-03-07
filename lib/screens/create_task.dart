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
        backgroundColor: Colors.black,
        title: GeneralAppText(text: "Create Task", size: 25, color: Colors.white, weight: FontWeight.bold),
      ),
      body: Stack(
        children: [
          TaskBackground(),
          CreateTaskBody(updateTask: updateTask,),
        ],
      ),
    );
  }
}
