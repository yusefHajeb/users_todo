part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class LoadingTodoState extends TodosState {}

class LoadedTodoState extends TodosState {
  final List<Todo> todos;

  LoadedTodoState({required this.todos});

  @override
  List<Object> get props => [todos];
}

class ErrorTodoState extends TodosState {
  final String message;

  ErrorTodoState({required this.message});

  @override
  List<Object> get props => [message];
}
