import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';
import 'package:task_manager_with_xd/screens/create_task.dart';
import 'package:task_manager_with_xd/widgets/home/homepage_body.dart';
import 'package:task_manager_with_xd/widgets/task_background.dart';


// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  TaskBloc taskBloc;
  final String date;

  Homepage({this.date});

  @override
  Widget build(BuildContext context) {
    taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(GetTasksEvent());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: GeneralAppText(
            text: "Task Manager",
            size: 25,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateTask()));
                },
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            TaskBackground(),
            HomepageBody(context: context, date: date),
          ],
        ));
  }
}
