import 'package:dartz/dartz.dart';
import 'package:users_todo/features/users/domain/repositories/users_repository.dart';

import '../../../../core/error/failure.dart';

class DeleteUserUsecase {
  final UsersRepository repository;

  DeleteUserUsecase({required this.repository});
  Future<Either<Failure, Unit>> call(int userId) async {
    return repository.deleteUseres(userId);
  }
}
