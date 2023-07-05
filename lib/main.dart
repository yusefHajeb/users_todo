import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/theme/app_them.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/bloc/todos_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.sl<TodosBloc>()..add(GetAllTodoEvent())),
        BlocProvider(create: (context) => di.sl<AddDeleteUpdateTodoBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
          ),
          body: Center(
            child: Text("Todos page"),
          ),
        ),
      ),
    );
  }
}
