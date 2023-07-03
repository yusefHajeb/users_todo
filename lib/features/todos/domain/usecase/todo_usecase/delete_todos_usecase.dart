import 'package:dartz/dartz.dart';
import 'package:users_todo/features/todos/domain/repositories/todo_repository.dart';

import '../../../../../core/error/failure.dart';

class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int todoId) async {
    return repository.deleteTodo(todoId);
  }
}
