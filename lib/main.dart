import 'package:flutter/material.dart';
import 'package:todo_app/views/todo_list_view.dart';


void main() {
  runApp(const ModernTodoApp());
}

class ModernTodoApp extends StatelessWidget {
  const ModernTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Todo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: const TodoListView(),
    );
  }
}
