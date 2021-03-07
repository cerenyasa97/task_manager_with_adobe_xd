import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/widgets/home/task_card.dart';

class TaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, TaskState state){
          final returnedTaskList = (state as GetTaskState).taskList;
          return GridView.count(
              crossAxisCount: 2,
              children: List.generate(returnedTaskList.length, (index) => TaskCard(index: index))
              );
        }
    );
  }
}
