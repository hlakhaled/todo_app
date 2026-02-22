import 'package:flutter/material.dart';

class TaskNameField extends StatelessWidget {
  const TaskNameField({super.key, required this.controller});

final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Name your task",
        border: UnderlineInputBorder(),
      ),
    );
  }
}