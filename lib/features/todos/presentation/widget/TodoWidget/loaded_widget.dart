// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/todo_entity.dart';

class LoadidTodosWidget extends StatelessWidget {
  List<Todo> todos;
  LoadidTodosWidget({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (_) => DetailsTodos(detail: todos[index])));
                },
                title: Text(todos[index].title.toString()),
                leading: CircleAvatar(
                  child: Text(todos[index].id.toString()),
                  backgroundColor: Colors.amber,
                ),
                trailing: todos[index].completed.toString() == "true"
                    ? const Icon(
                        Icons.done,
                        color: Color.fromARGB(255, 44, 215, 89),
                      )
                    : null)
          ],
        );
      },
      itemCount: todos.length,
    );
  }
}
