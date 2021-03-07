import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:task_manager_with_xd/bloc/task_bloc.dart';
import 'package:task_manager_with_xd/core/general_app_text.dart';
import 'package:task_manager_with_xd/models/task.dart';
import 'package:task_manager_with_xd/widgets/home/rotated_text.dart';

class LastTaskDateTimeText extends StatelessWidget {

  final String title;
  final int index;

  LastTaskDateTimeText({@required this.title, @required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state){
      final List<Task> taskList = (state as GetTaskState).taskList;
      final List<String> date = title == "start" ? taskList[index].startDate.split("-") : taskList[index].endDate.split("-");
      final String time = title == "start" ? taskList[index].startTime : taskList[index].endTime;
      return title == "start" ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedText(text: date[2], flag: title),
          Column(children: [
            GeneralAppText(text: DateTime.parse(date.join("-")).format("M") + " " + date[0], size: 15,),
            GeneralAppText(text: time, size: 15,)
          ],),
        ],
      ) : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            GeneralAppText(text: DateTime.parse(date.join("-")).format("M") + " " + date[0], size: 15,),
            GeneralAppText(text: time, size: 15,)
          ],),
          RotatedText(text: date[2], flag: title),
        ],
      );
    });
  }
}
