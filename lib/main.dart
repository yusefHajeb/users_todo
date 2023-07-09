import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/theme/app_them.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/bloc/todos_bloc.dart';
import 'package:users_todo/features/users/presintaion/page/users_page.dart';
import 'features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';
import 'features/users/presintaion/bloc/UserBloc/user_bloc.dart';
import 'features/users/presintaion/bloc/bloc/and_delete_update_users_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.sl<TodosBloc>()..add(GetAllTodoEvent())),
        BlocProvider(create: (context) => di.sl<AddDeleteUpdateTodoBloc>()),
        BlocProvider(
            create: (context) => di.sl<UserBloc>()..add(GetAllUserEvent())),
        BlocProvider(create: (context) => di.sl<AddDeleteUpdateUsersBloc>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Posts App',
          theme: appTheme,
          home: UsersPage()),
    );
  }
}
