import 'package:dartz/dartz.dart';
import 'package:users_todo/features/users/domain/repositories/users_repository.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

import '../../../../core/error/failure.dart';

class AddUserUsecase {
  final UsersRepository repository;

  AddUserUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(Users user) async {
    return await repository.addUsers(user);
  }
}
