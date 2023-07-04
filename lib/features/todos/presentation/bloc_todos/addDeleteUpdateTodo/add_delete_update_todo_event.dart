part of '../addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';

abstract class AddDeleteUpdateTodoEvent extends Equatable {
  const AddDeleteUpdateTodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends AddDeleteUpdateTodoEvent {
  final Todo todo;

  const AddTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends AddDeleteUpdateTodoEvent {
  final Todo todo;

  const UpdateTodoEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends AddDeleteUpdateTodoEvent {
  final int todoId;

  const DeleteTodoEvent({required this.todoId});
  @override
  List<Object> get props => [todoId];
}
