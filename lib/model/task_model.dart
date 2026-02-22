class TaskModel {
  String title;
  String time;
  bool isDone;
  String category;
  String id;

  TaskModel({
    required this.id,
    required this.title,
    required this.time,
    this.isDone = false,
    required this.category,
  });
}
