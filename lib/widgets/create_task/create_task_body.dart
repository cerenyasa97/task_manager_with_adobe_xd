import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';
import 'package:task_manager_with_xd/models/task.dart';
import 'package:task_manager_with_xd/utils/constants.dart';
import 'package:task_manager_with_xd/widgets/create_task/create_button.dart';
import 'package:task_manager_with_xd/widgets/create_task/date_time_picker.dart';
import 'package:task_manager_with_xd/widgets/create_task/priority.dart';
import 'package:task_manager_with_xd/widgets/create_task/task_create_separator.dart';
import 'package:task_manager_with_xd/widgets/task_text_field.dart';

// ignore: must_be_immutable
class CreateTaskBody extends StatefulWidget {
  Task updateTask;

  CreateTaskBody({this.updateTask});

  @override
  _CreateTaskBodyState createState() => _CreateTaskBodyState();
}

class _CreateTaskBodyState extends State<CreateTaskBody> {
  String _title, _description;
  DateTime _start, _end;
  int _priority;
  int _isDone;
  Task task;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.updateTask != null) {
      task = widget.updateTask;
      _title = task.taskTitle;
      _description = task.taskDescription;
      _start = DateTime.parse(task.startDate + " " + task.startTime);
      _end = DateTime.parse(task.endDate + " " + task.endTime);
      _priority = task.priority;
      _isDone = task.isDone;
    } else {
      _priority = int.parse(Constants.priority[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GeneralAppText(
          text: "Task Title",
          color: const Color(0xff5d6798),
        ),
        TaskCreateSeparator(
          width: width * 0.9,
          height: 2,
          color: const Color(0xff5d6798),
        ),
        TaskTextField(
          initialText:
              widget.updateTask != null ? widget.updateTask.taskTitle : null,
          onChanged: (String value) {
            _title = value;
          },
          maxLine: null,
          marginWidth: width * 0.05,
          height: height * 0.066,
        ),
        GeneralAppText(
          text: "Task Description",
          color: const Color(0xff5d6798),
        ),
        TaskCreateSeparator(
          width: width * 0.9,
          height: 2,
          color: const Color(0xff5d6798),
        ),
        TaskTextField(
            initialText: widget.updateTask != null
                ? widget.updateTask.taskDescription
                : null,
            onChanged: (String value) {
              _description = value;
            },
            marginWidth: width * 0.05,
            height: height * 0.16,
            maxLine: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GeneralAppText(
                  text: "Start Date",
                  color: const Color(0xff5d6798),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TaskCreateSeparator(
                  width: width * 0.3,
                  height: 2,
                  color: const Color(0xff5d6798),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TaskDateTimePicker(
                    initialDate: widget.updateTask != null
                        ? DateTime.parse(widget.updateTask.startDate +
                            " " +
                            widget.updateTask.startTime)
                        : null,
                    onDateChange: (DateTime date) {
                      _start = date;
                    }),
              ],
            ),
            Column(
              children: [
                GeneralAppText(
                  text: "End Date",
                  color: const Color(0xff5d6798),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TaskCreateSeparator(
                  width: width * 0.3,
                  height: 2,
                  color: const Color(0xff5d6798),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TaskDateTimePicker(
                    initialDate: widget.updateTask != null
                        ? DateTime.parse(widget.updateTask.endDate +
                            " " +
                            widget.updateTask.endTime)
                        : null,
                    onDateChange: (DateTime date) {
                      _end = date;
                    }),
              ],
            )
          ],
        ),
        GeneralAppText(
          text: "Priority",
          color: const Color(0xff5d6798),
        ),
        TaskCreateSeparator(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 2,
          color: const Color(0xff5d6798),
        ),
        Priority(
          initialPriority: widget.updateTask != null
              ? widget.updateTask.priority.toString()
              : null,
          onSubmitted: (int value) {
            _priority = value;
          },
        ),
        CreateButton(
          onPressed: () {
            if (_title != null &&
                _title.length > 2 &&
                _start != null &&
                _end != null &&
                _priority != null) {
              widget.updateTask == null
                  ? taskBloc.add(CreateTaskEvent(
                      task: Task(
                      _title,
                      _description ?? " ",
                      formatDate(_start, [yyyy, "-", mm, "-", dd]),
                      formatDate(_start, [hh, ":", nn]),
                      formatDate(_end, [yyyy, "-", mm, "-", dd]),
                      formatDate(_end, [hh, ":", nn]),
                      _priority ?? int.parse(Constants.priority[0]),
                      0,
                    )))
                  : taskBloc.add(UpdateTaskEvent(
                      task: Task.withID(
                      widget.updateTask.taskID,
                      _title,
                      _description,
                      formatDate(_start, [yyyy, "-", mm, "-", dd]),
                      formatDate(_start, [hh, ":", nn]),
                      formatDate(_end, [yyyy, "-", mm, "-", dd]),
                      formatDate(_end, [hh, ":", nn]),
                      _priority,
                      _isDone,
                    )));
              taskBloc.add(GetTasksEvent(date: "getLast"));
              Navigator.of(context).pop();
            } else {
              showAlert(
                  "Alert",
                  "Title must contain at least 3 and start, end, priority sections cannot be blank.",
                  context);
            }
          },
        )
      ],
    );
  }

  void showAlert(title, content, context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.044),
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              margin: EdgeInsets.only(right: width / 20, bottom: height / 100),
              width: width * 0.17,
              height: height * 0.058,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                gradient: LinearGradient(
                  begin: Alignment(0.7, -0.76),
                  end: Alignment(-0.68, 0.72),
                  colors: [const Color(0xff5d6798), const Color(0xff767fae)],
                  stops: [0.0, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff929ac2),
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Center(
                child: GeneralAppText(
                  text: "OK",
                  size: 15,
                ),
              )),
        )
      ],
    );

    // Shows the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
