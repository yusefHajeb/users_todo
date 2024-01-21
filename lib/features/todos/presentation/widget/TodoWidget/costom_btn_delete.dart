import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';
import '../../../../../core/Util/message_snackbar.dart';
import '../../../../../core/widget/outline_button_with_text.dart';
import '../../pages/todo_page.dart';
import '../../../../../core/widget/dialoge_loading_widget.dart';
import '../../../../../core/widget/loading_widget.dart';

class CostomDeleteTodoBtn extends StatelessWidget {
  final int todoId;
  const CostomDeleteTodoBtn({Key? key, required this.todoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButtonWithText(
          width: 100,
          content: "Delete",
          onPressed: () {
            deleteDialog(context, todoId);
          }),
    );
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

            return DeleteDialogWidget(id: todoId);
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
