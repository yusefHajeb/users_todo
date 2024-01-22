import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/bloc/todos_bloc.dart';
import 'package:users_todo/features/todos/presentation/pages/add_todo_page.dart';
import 'package:users_todo/core/widget/error_todo_widget.dart';
import '../../../../core/DarckBackground/dark_background.dart';
import '../../../../core/color/app_colors2.dart';
import '../../../../core/widget/app_bar.dart';
import '../widget/TodoWidget/loaded_widget.dart';
import '../../../../core/widget/loading_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Todos"),
      body: _buildBody(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is LoadingTodoState) {
              return LoadingWidget();
            } else if (state is LoadedTodoState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: LoadidTodosWidget(todos: state.todos));
            } else if (state is ErrorTodoState) {
              return MessageDisplayWidget(
                message: state.message,
              );
            }

            return LoadingWidget();
          },
        ),
      ],
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<TodosBloc>(context).add(RefreshTodoEvent());
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const TodoAddUpdatePage(isUpdateTodo: false))),
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const TodoAddUpdatePage(isUpdateTodo: false))),
      ),
    );
  }
}
