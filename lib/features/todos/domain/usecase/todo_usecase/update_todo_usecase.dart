import 'package:dartz/dartz.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/todo_repository.dart';

class UpdateTodoUsecase {
  final TodoRepository repository;

  UpdateTodoUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(Todo todo) async {
    return repository.updateTodo(todo);
  }
}
