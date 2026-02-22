
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  final List<TaskModel> _tasks = [];
  var _category = "";

  String get category => _category;
  List<TaskModel> get tasks => _tasks;
  void addTask(TaskModel task) {
    _tasks.add(task);
    emit(TaskLoaded(tasks: _tasks));
  }

  void selectCategory(String category) {
    _category = category;
    emit(TaskLoaded(tasks: _tasks));
  }

  void toggleTaskStatus(TaskModel task, bool? isDone) {
    task.isDone = isDone ?? false;
    emit(TaskLoaded(tasks: _tasks));
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    emit(TaskLoaded(tasks: _tasks));
  }
}
