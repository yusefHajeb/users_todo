import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_todo/features/users/data/models/users/users.dart';

import '../../../../core/error/exception.dart';

abstract class UserLocalDataSource {
  Future<List<UsersModel>> getCachedUsers();
  Future<Unit> cacheUser(List<UsersModel> usermodel);
}

class UserLocalDataSourceImp extends UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<Unit> cacheUser(List<UsersModel> usermodel) {
    List userModelToJson = usermodel
        .map<Map<String, dynamic>>((usermodel) => usermodel.toMap())
        .toList();

    sharedPreferences.setString("CACHED_USERS", userModelToJson.toString());
    return Future.value(unit);
  }

  @override
  Future<List<UsersModel>> getCachedUsers() {
    final jsonData = sharedPreferences.getString('CACHED_USERS');
    if (jsonData != null) {
      List decodeJsonData = json.decode(jsonData);
      List<UsersModel> jsonTodoModel = decodeJsonData
          .map<UsersModel>((jsonTodo) => UsersModel.fromJson(jsonTodo))
          .toList();
      return Future.value(jsonTodoModel);
    }
    throw EmptyCasheExpention();
  }
}
