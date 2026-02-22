import 'package:flutter/material.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/views/widgets/home_header.dart';
import 'package:todo_app/views/widgets/task_list.dart';
import 'package:provider/provider.dart';

enum TaskFilter { all, pending, completed }

class TaskView extends StatelessWidget {
  final TaskFilter filter;

  const TaskView({super.key, required this.filter});

  List<TaskModel> _getFilteredTasks(BuildContext context) {
    final tasks = context.read<TaskController>().tasks;
    switch (filter) {
      case TaskFilter.pending:
        return tasks.where((t) => !t.isDone).toList();
      case TaskFilter.completed:
        return tasks.where((t) => t.isDone).toList();
      case TaskFilter.all:
        return tasks;
    }
  }

  String _getTitle() {
    switch (filter) {
      case TaskFilter.pending:
        return "Pending";
      case TaskFilter.completed:
        return "Completed";
      case TaskFilter.all:
        return "Tasks";
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _getFilteredTasks(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          HomeHeader(
            title: _getTitle(),
            selectedIndex: filter.index,
            onAddPressed: () {},
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Consumer<TaskController>(
              builder: (context, taskController, child) {
                return TaskList(tasks: filteredTasks);
              },
            ),
          ),
        ],
      ),
    );
  }
}
