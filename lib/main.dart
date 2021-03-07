import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/screens/homepage.dart';
import 'bloc/priority_color/priority_color_bloc.dart';
import 'bloc/task/task_bloc.dart';
import 'locator/service_locator.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PriorityColorBloc>(
      create: (context) => PriorityColorBloc(),
      child: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task Manager',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Homepage(date: "all"),
        ),
      ),
    );
  }
}