import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/model/task_model.dart';

class TaskController extends ChangeNotifier {
  final List<TaskModel> _tasks = [];
  var _category = "";

  String get category => _category;
  List<TaskModel> get tasks => _tasks;
  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void selectCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void toggleTaskStatus(TaskModel task, bool? isDone) {
    task.isDone = isDone ?? false;
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
