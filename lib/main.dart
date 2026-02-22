import 'package:flutter/material.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeView(),
      ),
    );
  }
}
