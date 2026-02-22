part of 'task_cubit.dart';

class TaskState {
  final List<TaskModel> tasks;
  TaskState({required this.tasks});

  TaskState copyWith({List<TaskModel>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }

  factory TaskState.initial() {
    return TaskState(tasks: []);
  }
}
