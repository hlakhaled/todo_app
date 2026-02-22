import 'package:flutter/material.dart';

class TodoInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const TodoInputField({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Add a new task...',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.add_circle,
                size: 32,
                color: Colors.deepPurple,
              ),
              onPressed: onAdd,
            ),
          ),
          onSubmitted: (_) => onAdd(),
        ),
      ),
    );
  }
}