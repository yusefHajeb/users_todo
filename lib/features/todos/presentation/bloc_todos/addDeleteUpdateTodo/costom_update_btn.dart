import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';

import '../../../../../core/color/app_colors2.dart';
import '../../pages/add_todo_page.dart';

class CostomUpdateTodoBtn extends StatelessWidget {
  final Todo todo;
  const CostomUpdateTodoBtn({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 100,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      TodoAddUpdatePage(isUpdateTodo: true, todo: todo)));
        },
        color: AppColors.primaryAccentColor,
        child: Row(
          children: [
            Icon(FontAwesomeIcons.edit,
                size: 15, color: AppColors.primaryBackgroundColor),
            SizedBox(
              width: 20,
            ),
            Text(
              "Update",
              style: TextStyle(color: AppColors.primaryBackgroundColor),
            )
          ],
        ));
  }
}
