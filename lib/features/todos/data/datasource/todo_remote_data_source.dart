import 'package:dartz/dartz.dart';
import 'package:users_todo/features/todos/data/models/todo_models.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getAllTodo();
  Future<Unit> deleteTodo(int todoId);
  Future<Unit> updateTodo(TodoModel todo);
  Future<Unit> addTodo(TodoModel todo);
}

class TodoRemoteDataSourceImp implements TodoRemoteDataSource {
  @override
  Future<Unit> addTodo(TodoModel todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteTodo(int todoId) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    // TODO: implement getAllTodo
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateTodo(TodoModel todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
