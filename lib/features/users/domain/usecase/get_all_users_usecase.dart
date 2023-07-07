import 'package:dartz/dartz.dart';
import 'package:users_todo/features/users/data/repositories/users_repository.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

import '../../../../core/error/failure.dart';

class GetAllUsers {
  final UsersRepository repository;

  GetAllUsers(this.repository);

  Future<Either<Failure, List<Users>>> call() async {
    return await repository.getAllUsers();
  }
}
