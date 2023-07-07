import 'package:dartz/dartz.dart';
import 'package:users_todo/features/users/data/repositories/users_repository.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

import '../../../../core/error/failure.dart';

class UpdaeUsercase {
  final UsersRepository repository;

  UpdaeUsercase(this.repository);

  Future<Either<Failure, Unit>> call(Users user) async {
    return repository.updateUsers(user);
  }
}
