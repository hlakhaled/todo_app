import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/views/widgets/todo_input_field.dart';
import 'package:todo_app/views/widgets/todo_item_tile.dart';


class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListView> {
  final List<TodoModel> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _tasks.insert(0, TodoModel(title: _controller.text.trim()));
      _controller.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Day',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        children: [
          TodoInputField(
            controller: _controller,
            onAdd: _addTask,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: Row(
              children: [
                Text(
                  "Swipe left to delete",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: _tasks.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return TodoItemTile(
                        task: _tasks[index],
                        onToggle: () => _toggleTask(index),
                        onDelete: () => _deleteTask(index),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.auto_awesome,
            size: 64,
            color: Colors.grey.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          const Text(
            "All caught up!",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}