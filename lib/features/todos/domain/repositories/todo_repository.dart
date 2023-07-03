import 'package:dartz/dartz.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getAllTodos();
  Future<Either<Failure, Unit>> deleteTodo(int id);
  Future<Either<Failure, Unit>> updateTodo(Todo todo);
  Future<Either<Failure, Unit>> addTodo(Todo todo);
}
