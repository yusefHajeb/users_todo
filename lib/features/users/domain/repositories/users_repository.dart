import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<Users>>> getAllUsers();
  Future<Either<Failure, Unit>> addUsers(Users user);
  Future<Either<Failure, Unit>> updateUsers(Users user);
  Future<Either<Failure, Unit>> deleteUseres(int userId);
}
