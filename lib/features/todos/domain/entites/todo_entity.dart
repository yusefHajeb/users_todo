import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int? userId;
  final int? id;
  final String title;
  final bool completed;

  Todo({this.userId, this.id, required this.title, required this.completed});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, userId, completed];
}
