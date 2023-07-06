import 'package:flutter/material.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/costom_btn_delete.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/costom_update_btn.dart';
import '../../../../core/Util/message_snackbar.dart';
import '../../../../core/Values/app_space.dart';
import '../../domain/entites/todo_entity.dart';
import '../bloc_todos/addDeleteUpdateTodo/costom_checkbox_completed.dart';

class TodoDeltailPage extends StatelessWidget {
  final Todo todo;

  const TodoDeltailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Center(
              child: Row(
                children: [
                  AppSpaces.horizontalSpace20,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(child: Text(todo.title)),
                  ),
                  CostomCheckboxCompleted(
                    completed: todo.completed,
                  ),
                ],
              ),
            ),
            AppSpaces.verticalSpace40,
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CostomDeleteBtn(todoId: todo.id!),
                CostomUpdateTodoBtn(todo: todo),
              ],
            ))
          ],
        ));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Detail Todo", style: myTheme(context).headline2),
    );
  }
}
