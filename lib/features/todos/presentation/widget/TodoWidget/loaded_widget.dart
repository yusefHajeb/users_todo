// import 'dart:html';

import 'package:flutter/material.dart';
import '../../../../../core/widget/todo_list_tail.dart';
import '../../../domain/entites/todo_entity.dart';

// ignore: must_be_immutable
class LoadidTodosWidget extends StatelessWidget {
  List<Todo> todos;
  LoadidTodosWidget({required this.todos});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TodoListTial(
                todo: todos[index],
              );
            },
            itemCount: todos.length,
          ),
        ));
  }
}
