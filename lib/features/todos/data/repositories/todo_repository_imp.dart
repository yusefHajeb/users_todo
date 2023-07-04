import 'package:users_todo/core/network/check_network.dart';
import 'package:users_todo/features/todos/data/datasource/todo_local_data_source.dart';
import 'package:users_todo/features/todos/data/models/todo_models.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:users_todo/features/todos/domain/repositories/todo_repository.dart';

import '../../../../core/error/exception.dart';
import '../datasource/todo_remote_data_source.dart';

typedef DelelteOrUpdateOrAdd = Future<Unit> Function();

class TodoRepositoryImp implements TodoRepository {
  final TodoRemoteDataSource todoRemoteDataSource;
  final TodoLocalDataSource todoLocalDataSource;
  final NetworkInfo networkInfo;
  TodoRepositoryImp(
      {required this.networkInfo,
      required this.todoRemoteDataSource,
      required this.todoLocalDataSource});
  @override
  Future<Either<Failure, List<Todo>>> getAllTodos() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodos = await todoRemoteDataSource.getAllTodo();
        todoLocalDataSource.cashTodos(remoteTodos);
        return Right(remoteTodos);
      } on ServerExpinton {
        return left(ServerFailure());
      }
    } else {
      try {
        final localTodo = await todoLocalDataSource.getCashedTodo();
        return right(localTodo);
      } on EmptyCasheExpention {
        return left(EmptyCasheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addTodo(Todo todo) async {
    TodoModel todoModel = TodoModel(
        userId: todo.userId,
        id: todo.id,
        title: todo.title,
        completed: todo.completed);
    return await _getMessage(() => todoRemoteDataSource.addTodo(todoModel));
  }

  @override
  Future<Either<Failure, Unit>> deleteTodo(int todoId) async {
    return await _getMessage(() => todoRemoteDataSource.deleteTodo(todoId));
  }

  @override
  Future<Either<Failure, Unit>> updateTodo(Todo todo) async {
    TodoModel todoModel = TodoModel(
        userId: todo.userId,
        id: todo.id,
        title: todo.title,
        completed: todo.completed);
    return await _getMessage(() => todoRemoteDataSource.updateTodo(todoModel));
  }

  Future<Either<Failure, Unit>> _getMessage(
      DelelteOrUpdateOrAdd deleteOrUpdateOrAddTodo) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddTodo;
        return Right(unit);
      } on ServerExpinton {
        return Left(ServerFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }
}
