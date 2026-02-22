import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/task_cubit.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/views/widgets/home_header.dart';
import 'package:todo_app/views/widgets/task_list.dart';
import 'package:provider/provider.dart';

enum TaskFilter { all, pending, completed }

class TaskView extends StatelessWidget {
  final TaskFilter filter;

  const TaskView({super.key, required this.filter});

  List<TaskModel> _getFilteredTasks(BuildContext context) {
    final tasks = context.read<TaskCubit>().tasks;
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
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoaded) {
                  return TaskList(tasks: filteredTasks);
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.event_note, size: 80, color: Colors.grey[400]),
                      const SizedBox(height: 20),
                      Text(
                        "No tasks yet!",
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
