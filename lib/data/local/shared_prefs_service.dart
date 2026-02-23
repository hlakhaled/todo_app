import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/data/model/task_model.dart';

class SharedPrefsService {
  Future<void> addData(TaskModel todo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoList = prefs.getStringList('todos') ?? [];
    final String data = jsonEncode(todo.toMap());
    todoList.add(data);
    await prefs.setStringList('todos', todoList);
    print('Data added: $data');
  }

  Future<List<TaskModel>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoList = prefs.getStringList('todos') ?? [];
    return todoList.map((item) {
      final Map<String, dynamic> data = jsonDecode(item);
      return TaskModel(
        id: data['id'],
        title: data['title'],
        time: data['time'],
        isDone: data['isDone'],
        category: data['category'],
      );
    }).toList();
  }

  Future<void> deleteData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoList = prefs.getStringList('todos') ?? [];
    todoList.removeWhere((item) {
      final Map<String, dynamic> data = jsonDecode(item);
      return data['id'] == id;
    });
    await prefs.setStringList('todos', todoList);
  }

  Future<void> saveAll(List<TaskModel> tasks) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoList = tasks
        .map((task) => jsonEncode(task.toMap()))
        .toList();
    await prefs.setStringList('todos', todoList);
  }
}
