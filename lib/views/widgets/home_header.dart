import 'package:flutter/material.dart';
import 'package:todo_app/views/add_task_view.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  final int selectedIndex;
  final VoidCallback onAddPressed;

  const HomeHeader({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        if (selectedIndex == 0)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTaskView()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          )
        else if (selectedIndex == 1)
          const Icon(Icons.timer_outlined, color: Colors.redAccent, size: 30)
        else
          const Icon(Icons.check_circle, color: Colors.teal, size: 30),
      ],
    );
  }
}
