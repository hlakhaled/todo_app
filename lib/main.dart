import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/task_cubit.dart';
import 'package:todo_app/data/local/shared_prefs_service.dart';
import 'package:todo_app/views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(prefsService: SharedPrefsService()),
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
