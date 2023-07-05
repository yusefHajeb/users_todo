import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_todo/core/error/exception.dart';
import 'package:users_todo/features/todos/data/models/todo_models.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getCashedTodo();
  Future<Unit> cashTodos(List<TodoModel> local);
}

class TodoLocalDataSourceImp implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<Unit> cashTodos(List<TodoModel> todoModel) {
    List todoJsonToModel =
        todoModel.map<Map<String, dynamic>>((todo) => todo.toJson()).toList();

    sharedPreferences.setString("CACHED_TODOS", json.encode(todoJsonToModel));
    return Future.value(unit);
  }

  @override
  Future<List<TodoModel>> getCashedTodo() {
    final jsonData = sharedPreferences.getString('CACHED_TODOS');
    if (jsonData != null) {
      List decodeJsonData = json.decode(jsonData);
      List<TodoModel> jsonTodoModel = decodeJsonData
          .map<TodoModel>((jsonTodo) => TodoModel.fromJson(jsonTodo))
          .toList();
      return Future.value(jsonTodoModel);
    }
    throw EmptyCasheExpention();
  }
}
