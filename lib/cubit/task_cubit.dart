import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/local/shared_prefs_service.dart';
import 'package:todo_app/data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final SharedPrefsService prefsService;

  TaskCubit({required this.prefsService}) : super(TaskState.initial()) {
    loadTasks();
  }

  String _category = "";

  List<TaskModel> get tasks => state.tasks;
  String get category => _category;

  Future<void> loadTasks() async {
    final loadedTasks = await prefsService.getData();
    emit(TaskState(tasks: loadedTasks));
  }

  Future<void> addTask(TaskModel task) async {
    final List<TaskModel> updatedTasks = List.from(state.tasks)..add(task);
    await prefsService.addData(task);
    emit(TaskState(tasks: updatedTasks));
  }

  void selectCategory(String category) {
    _category = category;
    emit(TaskState(tasks: state.tasks));
  }

  Future<void> toggleTaskStatus(TaskModel task, bool? isDone) async {
    final List<TaskModel> updatedTasks = List.from(state.tasks);

    final index = updatedTasks.indexWhere((t) => t.id == task.id);

    if (index != -1) {
      updatedTasks[index] = task.copyWith(isDone: isDone ?? false);
    }

    await prefsService.saveAll(updatedTasks);

    emit(TaskState(tasks: updatedTasks));
  }

  Future<void> deleteTask(TaskModel task) async {
    final List<TaskModel> updatedTasks = state.tasks
        .where((t) => t.id != task.id)
        .toList();

    await prefsService.saveAll(updatedTasks);

    emit(TaskState(tasks: updatedTasks));
  }
}
