import 'package:flutter/material.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:provider/provider.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  final List<String> _categories = const [
    "Personal",
    "Work",
    "Health",
    "Family",
    "Learning",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: Consumer<TaskController>(
        builder: (context, taskController, child) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: taskController.category.isEmpty
                  ? null
                  : taskController.category,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
              hint: const Text(
                "Choose a category",
                style: TextStyle(color: Colors.grey),
              ),
              items: _categories
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          _categoryIcon(e),
                          const SizedBox(width: 10),
                          Text(e, style: TextStyle(color: _categoryColor(e))),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                taskController.selectCategory(val!);
              },
            ),
          );
        },
      ),
    );
  }

  // UI Helper for Icons
  Widget _categoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'personal':
        return const Icon(Icons.person, color: Color(0xFF00A99D));
      case 'work':
        return const Icon(Icons.work, color: Color(0xFF4A90E2));
      case 'health':
        return const Icon(Icons.favorite, color: Color(0xFFFF6B6B));
      case 'family':
        return const Icon(Icons.home, color: Color(0xFF7B61FF));
      case 'learning':
        return const Icon(Icons.school, color: Color(0xFFF5A623));
      default:
        return const Icon(Icons.label, color: Colors.black);
    }
  }

  // UI Helper for Colors
  Color _categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'personal':
        return const Color(0xFF00A99D);
      case 'work':
        return const Color(0xFF4A90E2);
      case 'health':
        return const Color(0xFFFF6B6B);
      case 'family':
        return const Color(0xFF7B61FF);
      case 'learning':
        return const Color(0xFFF5A623);
      default:
        return Colors.black;
    }
  }
}
