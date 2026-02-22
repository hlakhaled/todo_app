import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasks;
 

  const TaskList({
    super.key,
    required this.tasks,
  
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskItem(
          task: task,
        );
      },
    );
  }
}