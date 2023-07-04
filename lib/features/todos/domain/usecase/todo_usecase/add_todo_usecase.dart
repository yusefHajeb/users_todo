import 'package:dartz/dartz.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:users_todo/features/todos/domain/repositories/todo_repository.dart';

import '../../entites/todo_entity.dart';

class AddTodoUsecase {
  final TodoRepository todoRepository;

  AddTodoUsecase(this.todoRepository);

  Future<Either<Failure, Unit>> call(Todo todo) async {
    return await todoRepository.addTodo(todo);
  }
}
