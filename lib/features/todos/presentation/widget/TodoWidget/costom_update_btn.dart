import 'package:flutter/material.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';
import '../../../../../core/widget/outline_button_with_text.dart';
import '../../pages/add_todo_page.dart';

class CostomUpdateTodoBtn extends StatelessWidget {
  final Todo todo;
  const CostomUpdateTodoBtn({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonWithText(
        content: "Update",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      TodoAddUpdatePage(isUpdateTodo: true, todo: todo)));
        });
  }
}
