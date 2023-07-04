part of '../addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';

abstract class AddDeleteUpdateTodoState extends Equatable {
  const AddDeleteUpdateTodoState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdateTodoInitial extends AddDeleteUpdateTodoState {}

class LoadingAddUpdateDeleteState extends AddDeleteUpdateTodoState {}

class SuccessAddUpdateDeleteState extends AddDeleteUpdateTodoState {
  final String messege;

  SuccessAddUpdateDeleteState({required this.messege});
  @override
  List<Object> get props => [messege];
}

class ErrorAddUpdateDeleteState extends AddDeleteUpdateTodoState {
  final String messege;

  const ErrorAddUpdateDeleteState({required this.messege});
  @override
  List<Object> get props => [messege];
}
