import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/core/Values/app_space.dart';

import '../../features/todos/domain/entites/todo_entity.dart';
import '../../features/todos/presentation/pages/delete_edite_todo.dart';
import '../color/app_colors2.dart';

class TodoListTial extends StatelessWidget {
  final Todo todo;
  const TodoListTial({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryBackgroundColor.withAlpha(0),
              AppColors.lightMauveBackgroundColor
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(width: 1, color: Colors.white),
        ),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: HexColor.fromHex("191B1F")),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => TodoDeltailPage(todo: todo)));
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                AppColors.lightMauveBackgroundColor,
                            child: Container(
                                // padding: EdgeInsets.all(5),
                                width: 40 * 0.8,
                                height: 40 * 0.8,
                                decoration: BoxDecoration(
                                    color: AppColors.lightMauveBackgroundColor,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    todo.id.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                  ),
                                )),
                          ),
                          AppSpaces.horizontalSpace10,
                          Text(todo.title.toString(),
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.2)),
                          Center(
                              child: todo.completed.toString() == "true"
                                  ? const Icon(
                                      Icons.done,
                                      color: Color.fromARGB(255, 44, 215, 89),
                                    )
                                  : null),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
