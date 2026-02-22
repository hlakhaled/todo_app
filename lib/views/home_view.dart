import 'package:flutter/material.dart';
import 'package:todo_app/views/task_view.dart';
import 'package:todo_app/views/widgets/bottom_nav.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    TaskView(filter: TaskFilter.all),
    TaskView(filter: TaskFilter.pending),
    TaskView(filter: TaskFilter.completed),
  ];

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        child: BottomNav(selectedIndex: _selectedIndex, onTap: _changeTab),
      ),
    );
  }
}
