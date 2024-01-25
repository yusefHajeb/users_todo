import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/core/Util/extentions.dart';
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
        // padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryBackgroundColor.withOpacity(0.4),
              AppColors.lightMauveBackgroundColor
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(width: 1, color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      HexColor.fromHex("3C3E49"),
                      AppColors.primaryBackgroundColor,
                      AppColors.lightMauveBackgroundColor,
                    ]),
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => TodoDeltailPage(todo: todo)));
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    AppColors.lightMauveBackgroundColor,
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.lightMauveBackgroundColor,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Text(
                                        todo.id.toString(),
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.displayMedium!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                      ),
                                    )),
                              ),
                              AppSpaces.horizontalSpace20,
                              Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                alignment: WrapAlignment.spaceBetween,
                                runAlignment: WrapAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todo.title.toString(),
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppSpaces.horizontalSpace20,
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
