import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/widgets/core/general_app_text.dart';
import 'package:task_manager/widgets/error_widget.dart';
import 'description_dialog.dart';
import 'is_done_check.dart';
import 'last_task_date_time_text.dart';

// Structure of each task card
// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  final index;
  String taskTitle;
  var priorityValue;
  String priorityColor;

  TaskCard({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      if (state is GetTaskState) {
        priorityColor = state.taskList[index].priorityColor;
        taskTitle = state.taskList[index].taskTitle;
        return InkWell(
          onTap: () {
            return showDialog(
              context: context,
              builder: (context){
                return DescriptionDialog(index: index);
              }
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: 150.0,
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38.0),
              color: convertColor(),
              boxShadow: [
                BoxShadow(
                  color: convertColor(),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IsDoneCheck(index: index,),
                    GeneralAppText(text: taskTitle.length < 9 ? taskTitle : taskTitle.substring(0, 5) + "..."),
                  ],
                ),
                Divider(thickness: 2,),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                LastTaskDateTimeText(title: "start", index: index),
                SizedBox(height: MediaQuery.of(context).size.height / 40,),
                LastTaskDateTimeText(title: "end", index: index),
              ],
            ),
          ),
        );
      }
      else {
        return TaskErrorWidget();
      }
    });
  }

    convertColor(){
      var color = priorityColor;
      var valueString = color.split('(0x')[1].split(')')[0];
      var value = int.parse(valueString, radix: 16);
      var otherColor = new Color(value);
      return otherColor;
    }
}