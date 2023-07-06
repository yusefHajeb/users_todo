import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/Util/message_snackbar.dart';
import 'package:users_todo/core/strings/message.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int todoId;
  const DeleteDialogWidget({Key? key, required this.todoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are You Sure Delete",
        style: myTheme(context).bodyText1,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("No!"),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdateTodoBloc>(context).add(
              DeleteTodoEvent(todoId: todoId),
            );
          },
          child: Text("Yes"),
        )
      ],
    );
  }
}
