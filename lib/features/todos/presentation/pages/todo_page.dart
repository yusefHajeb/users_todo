import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/bloc/todos_bloc.dart';
import 'package:users_todo/features/todos/presentation/widget/error_todo_widget.dart';
// import 'bloc/todos_bloc.dart';
import '../widget/loaded_widget.dart';
import '../widget/loading_widget.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
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
    });
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<TodosBloc>(context).add(RefreshTodoEvent());
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
