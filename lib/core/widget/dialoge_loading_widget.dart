import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/Util/message_snackbar.dart';
import 'package:users_todo/core/strings/message.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';
import 'package:users_todo/features/users/presintaion/bloc/bloc/and_delete_update_users_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int id;
  final bool? isUser;
  const DeleteDialogWidget({Key? key, required this.id, this.isUser})
      : super(key: key);

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
            if (isUser ?? false) {
              BlocProvider.of<AddDeleteUpdateUsersBloc>(context)
                  .add(DeleteUserEvent(userId: id));
            } else {
              BlocProvider.of<AddDeleteUpdateTodoBloc>(context).add(
                DeleteTodoEvent(todoId: id),
              );
            }
          },
          child: Text("Yes"),
        )
      ],
    );
  }
}
