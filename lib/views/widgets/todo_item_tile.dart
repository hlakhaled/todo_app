import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';


class TodoItemTile extends StatelessWidget {
  final TodoModel task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItemTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.redAccent.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 28,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: task.isDone
              ? Colors.white.withOpacity(0.6)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (!task.isDone)
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          leading: Checkbox(
            value: task.isDone,
            shape: const CircleBorder(),
            activeColor: Colors.deepPurple,
            onChanged: (_) => onToggle(),
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration:
                  task.isDone ? TextDecoration.lineThrough : null,
              color: task.isDone ? Colors.grey : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}