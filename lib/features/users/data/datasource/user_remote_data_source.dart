import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:users_todo/features/users/data/models/users/users.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class UserRemoteDataSource {
  Future<List<UsersModel>> getAllUsers();
  Future<Unit> deleteUser(int id);
  Future<Unit> addUser(UsersModel usersModel);
  Future<Unit> updateUser(UsersModel usersModel);
}

final baseUrl = "https://jsonplaceholder.typicode.com";

class UserRemoteDataSourceImp extends UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImp({required this.client});
  @override
  @override
  Future<List<UsersModel>> getAllUsers() async {
    final response = await client.get(
      Uri.parse("$baseUrl/users/"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      print("Stateus Code Is 200 ================ ");
      final List decodedJson = jsonDecode(response.body) as List;
      final List<UsersModel> todoModel = decodedJson
          .map((jsonTodoModel) => UsersModel.fromJson(jsonTodoModel))
          .toList();
      return todoModel;
    } else {
      throw ServerExpinton();
    }
  }

  Future<Unit> addUser(UsersModel user) async {
    final requestBody = {
      'id': user.id,
      'name': user.name,
      'username': user.username,
      'email': user.email,
      'address': user.address?.toMap(),
      'phone': user.phone,
      'website': user.website,
      'company': user.company,
    };
    final response = await client.post(
      Uri.parse("$baseUrl/users/"),
      body: requestBody,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerExpinton();
    }
  }

  @override
  Future<Unit> deleteUser(int id) async {
    final respone = await client.delete(Uri.parse("$baseUrl/users/$id"));
    if (respone.statusCode == 200) {
      return Future.value(unit);
    }
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateUser(UsersModel user) async {
    final requestBody = {
      'id': user.id,
      'name': user.name,
      'username': user.username,
      'email': user.email,
      'address': user.address?.toMap(),
      'phone': user.phone,
      'website': user.website,
      'company': user.company,
    };
    final response =
        await client.patch(Uri.parse("$baseUrl/users/"), body: requestBody);

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExpinton();
    }
  }
}
