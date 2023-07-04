import '../../domain/entites/todo_entity.dart';

class TodoModel extends Todo {
  TodoModel(
      {required int userId,
      required int id,
      required String title,
      required bool completed})
      : super(userId: userId, id: id, title: title, completed: completed);
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
