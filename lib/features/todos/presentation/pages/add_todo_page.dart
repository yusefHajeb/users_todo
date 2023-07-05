import 'package:flutter/material.dart';

import '../../domain/entites/todo_entity.dart';

class TodoAddUpdatePage extends StatelessWidget {
  final Todo? todo;
  final bool isUpdateTodo;
  const TodoAddUpdatePage({Key? key, this.todo, required this.isUpdateTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  AppBar _bildAppBar(bool isUpdate) {
    return AppBar(
      title: Text(isUpdate ? "Update Todo" : "Add Todo"),
    );
  }
}
