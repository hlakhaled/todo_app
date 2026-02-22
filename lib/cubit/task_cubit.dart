import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState.initial());

  var _category = "";
List<TaskModel> get tasks => state.tasks;
  String get category => _category;
  void addTask(TaskModel task) {
    List<TaskModel> tasks = state.tasks.toList();
    tasks.add(task);
    emit(TaskState(tasks: tasks));
  }

  void selectCategory(String category) {
    _category = category;
    emit(TaskState(tasks: state.tasks));
  }

  void toggleTaskStatus(TaskModel task, bool? isDone) {
    task.isDone = isDone ?? false;
    List<TaskModel> tasks = state.tasks.toList();
    int index = tasks.indexOf(task);
    tasks[index] = task;
    emit(TaskState(tasks: tasks));
  }

  void deleteTask(TaskModel task) {
    List<TaskModel> tasks = state.tasks.toList();
    tasks.remove(task);
    emit(TaskState(tasks: tasks));
  }
}
