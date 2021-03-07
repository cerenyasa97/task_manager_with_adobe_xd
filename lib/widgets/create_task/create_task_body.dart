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
        GeneralAppText(text: "Task Title"),
        TaskCreateSeparator(
          width: width * 0.9,
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
        GeneralAppText(text: "Task Description"),
        TaskCreateSeparator(
          width: width * 0.9,
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
                GeneralAppText(text: "Start Date"),
                SizedBox(
                  height: height * 0.01,
                ),
                TaskCreateSeparator(
                  width: width * 0.3,
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
                GeneralAppText(text: "End Date"),
                SizedBox(
                  height: height * 0.01,
                ),
                TaskCreateSeparator(
                  width: width * 0.3,
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
        GeneralAppText(text: "Priority"),
        TaskCreateSeparator(
          width: MediaQuery.of(context).size.width * 0.3,
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
            if (_title.length > 3 &&
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
                  "Title must contain at least 4 and start, end, priority sections cannot be blank.",
                  context);
            }
          },
        )
      ],
    );
  }

  void showAlert(title, content, context) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        RaisedButton(
          child: Text("Tamam"),
          onPressed: () {
            Navigator.pop(context);
          },
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
