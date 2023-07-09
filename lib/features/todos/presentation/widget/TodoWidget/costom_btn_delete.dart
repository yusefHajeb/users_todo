import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';

import '../../../../../core/Util/message_snackbar.dart';
import '../../../../../core/color/app_colors2.dart';
import '../../pages/todo_page.dart';
import '../../widget/addAndUpdate/dialoge_loading_widget.dart';
import '../../../../../core/widget/loading_widget.dart';

class CostomDeleteBtn extends StatelessWidget {
  final int todoId;
  const CostomDeleteBtn({Key? key, required this.todoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 100,
        onPressed: () {
          deleteDialog(context, todoId);
        },
        color: Colors.redAccent,
        child: Row(
          children: [
            Icon(FontAwesomeIcons.remove,
                size: 15, color: AppColors.primaryBackgroundColor),
            SizedBox(
              width: 20,
            ),
            Text(
              "Delete",
              style: TextStyle(color: AppColors.primaryBackgroundColor),
            )
          ],
        ));
  }

  void deleteDialog(BuildContext context, int todoId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdateTodoBloc,
              AddDeleteUpdateTodoState>(builder: (context, state) {
            if (state is LoadingAddUpdateDeleteState) {
              return AlertDialog(
                title: LoadingWidget(),
              );
            }

            return DeleteDialogWidget(todoId: todoId);
          }, listener: (context, state) {
            if (state is SuccessAddUpdateDeleteState) {
              MessageSnackBar().showMessageSnackBar(
                  state.messege, context, Colors.greenAccent);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => TodoPage()),
                  (route) => false);
            } else if (state is ErrorAddUpdateDeleteState) {
              Navigator.pop(context);
              MessageSnackBar().showMessageSnackBar(
                  state.messege, context, Colors.redAccent);
            }
          });
        });
  }
}
