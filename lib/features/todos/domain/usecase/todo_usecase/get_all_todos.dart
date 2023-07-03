import 'package:dartz/dartz.dart';
import 'package:users_todo/features/todos/domain/repositories/todo_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../entites/todo_entity.dart';

class GetAllTodoUsecase {
  final TodoRepository rerpository;

  GetAllTodoUsecase(this.rerpository);

  Future<Either<Failure, List<Todo>>> call() async {
    return rerpository.getAllTodos();
  }
}
