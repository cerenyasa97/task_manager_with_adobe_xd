import 'package:get_it/get_it.dart';
import 'package:task_manager_with_xd/data/task_repository.dart';
import 'package:task_manager_with_xd/utils/database_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => TaskRepository());
  locator.registerLazySingleton(() => DatabaseHelper());
}