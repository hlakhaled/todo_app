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

  String toMap() {
    return '{"id": "$id", "title": "$title", "time": "$time", "isDone": $isDone, "category": "$category"}';
  }
  TaskModel copyWith({
    String? id,
    String? title,
    String? time,
    bool? isDone,
    String? category,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
    );
  }
}
