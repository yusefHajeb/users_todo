import 'package:users_todo/features/users/data/models/users/users.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:users_todo/features/users/domain/repositories/users_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/check_network.dart';
import '../datasource/user_local_data_source.dart';
import '../datasource/user_remote_data_source.dart';

typedef DelelteOrUpdateOrAddUsers = Future<Unit> Function();

class UsersRepositoryImp implements UsersRepository {
  final UserRemoteDataSource userRemoteDataSource;

  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UsersRepositoryImp(
      {required this.userRemoteDataSource,
      required this.networkInfo,
      required this.localDataSource});
  @override
  Future<Either<Failure, List<Users>>> getAllUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final remotdata = await userRemoteDataSource.getAllUsers();
        localDataSource.cacheUser(remotdata);
        return Right(remotdata);
      } on ServerExpinton {
        return left(ServerFailure());
      }
    } else {
      try {
        final localData = await localDataSource.getCachedUsers();
        return right(localData);
      } on EmptyCasheExpention {
        return left(EmptyCasheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addUsers(Users user) {
    UsersModel usersModel = UsersModel(
      address: user.address,
      company: user.company,
      email: user.email,
      // id: user.id
      name: user.name,
      phone: user.phone,
      username: user.username,
      website: user.website,
    );
    return _getMessage(() => userRemoteDataSource.addUser(usersModel));
  }

  @override
  Future<Either<Failure, Unit>> deleteUseres(int id) async {
    return await _getMessage(() {
      return userRemoteDataSource.deleteUser(id);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateUsers(Users user) {
    UsersModel usersModel = UsersModel(
      address: user.address,
      company: user.company,
      email: user.email,
      // id: user.id
      name: user.name,
      phone: user.phone,
      username: user.username,
      website: user.website,
    );
    return _getMessage(() => userRemoteDataSource.updateUser(usersModel));
  }

  Future<Either<Failure, Unit>> _getMessage(
      DelelteOrUpdateOrAddUsers deleteOrUpdateOrAddUser) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddUser;
        return Right(unit);
      } on ServerExpinton {
        return Left(ServerFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }
}
