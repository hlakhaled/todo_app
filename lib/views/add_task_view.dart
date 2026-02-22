import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/views/widgets/category_dropdown.dart';
import 'package:todo_app/views/widgets/date_field.dart';
import 'widgets/add_task_header.dart';
import 'widgets/task_name_field.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24,
          right: 24,
          top: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AddTaskHeader(),
            const SizedBox(height: 40),
            TaskNameField(controller: _taskController),
            const SizedBox(height: 30),
            CategoryDropdown(),
            const SizedBox(height: 30),
            DateField(controller: _dateController),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  TaskModel newTask = TaskModel(
                   id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _taskController.text,
                    time: _dateController.text,
                    category: context.read<TaskController>().category,
                  );
                  context.read<TaskController>().addTask(newTask);
                  context.read<TaskController>().selectCategory("");
                  _taskController.clear();
                  _dateController.clear();
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
