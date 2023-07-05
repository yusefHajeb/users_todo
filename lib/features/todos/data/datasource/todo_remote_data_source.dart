import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:users_todo/features/todos/data/models/todo_models.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getAllTodo();
  Future<Unit> deleteTodo(int todoId);
  Future<Unit> updateTodo(TodoModel todo);
  Future<Unit> addTodo(TodoModel todo);
}

final baseUrl = "https://jsonplaceholder.typicode.com";

class TodoRemoteDataSourceImp implements TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSourceImp({required this.client});

  @override
  Future<List<TodoModel>> getAllTodo() async {
    print(" ================ $baseUrl/todos/ ");

    final response = await client.get(
      Uri.parse("$baseUrl/todos/"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      print("Stateus Code Is 200 ================ ");
      final List decodedJson = jsonDecode(response.body) as List;
      final List<TodoModel> todoModel = decodedJson
          .map((jsonTodoModel) => TodoModel.fromJson(jsonTodoModel))
          .toList();
      return todoModel;
    } else {
      throw ServerExpinton();
    }
  }

  @override
  Future<Unit> addTodo(TodoModel todo) async {
    final requestBody = {
      "title": todo.title,
      'userId': todo.userId,
      'completed': todo.completed
    };
    final response = await client.post(
      Uri.parse("$baseUrl/todos/"),
      body: requestBody,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerExpinton();
    }
  }

  @override
  Future<Unit> deleteTodo(int todoId) async {
    final response = await client.delete(Uri.parse("$baseUrl/todos/$todoId"));

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExpinton();
    }
  }

  @override
  Future<Unit> updateTodo(TodoModel todo) async {
    final todoId = todo.id;

    final requestBody = {
      "title": todo.title,
      'userId': todo.userId,
      'completed': todo.completed
    };

    final response = await client.patch(Uri.parse("$baseUrl/todo/$todoId"),
        body: requestBody);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExpinton();
    }
  }
}
