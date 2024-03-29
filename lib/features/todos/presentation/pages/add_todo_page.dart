import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/Util/extentions.dart';
import 'package:users_todo/core/Util/message_snackbar.dart';
import 'package:users_todo/features/todos/presentation/pages/todo_page.dart';
import 'package:users_todo/features/todos/presentation/widget/addAndUpdate/form_widget.dart';
import 'package:users_todo/core/widget/loading_widget.dart';
import '../../../../core/DarckBackground/dark_background.dart';
import '../../../../core/color/app_colors2.dart';
import '../../../../core/widget/app_bar.dart';
import '../../domain/entites/todo_entity.dart';
import '../bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';

class TodoAddUpdatePage extends StatelessWidget {
  final Todo? todo;
  final bool isUpdateTodo;
  const TodoAddUpdatePage({Key? key, this.todo, required this.isUpdateTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, "Add Todo", arrowBack: true),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Stack(
      children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                BlocConsumer<AddDeleteUpdateTodoBloc, AddDeleteUpdateTodoState>(
              builder: (context, state) {
                if (state is LoadingAddUpdateDeleteState) {
                  return const LoadingWidget();
                }
                return FormWidget(
                  isUpdate: isUpdateTodo,
                  todo: isUpdateTodo ? todo : null,
                );
              },
              listener: (context, state) {
                if (state is SuccessAddUpdateDeleteState) {
                  MessageSnackBar().showMessageSnackBar(
                      state.messege, context, HexColor.fromHex("87C76F"));
                  context.navigator.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const TodoPage()),
                      (route) => false);
                } else if (state is ErrorAddUpdateDeleteState) {
                  MessageSnackBar().showMessageSnackBar(
                    state.messege,
                    context,
                    Colors.redAccent,
                  );
                  context.navigator.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const TodoPage()),
                      (route) => false);
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
