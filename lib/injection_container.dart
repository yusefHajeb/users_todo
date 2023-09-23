import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_todo/core/network/check_network.dart';
import 'package:users_todo/features/todos/data/datasource/todo_local_data_source.dart';
import 'package:users_todo/features/todos/data/datasource/todo_remote_data_source.dart';
import 'package:users_todo/features/todos/data/repositories/todo_repository_imp.dart';
import 'package:users_todo/features/todos/domain/repositories/todo_repository.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/add_todo_usecase.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/delete_todos_usecase.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/get_all_todos.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/update_todo_usecase.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/bloc/todos_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:users_todo/features/users/data/datasource/user_remote_data_source.dart';
import 'package:users_todo/features/users/domain/repositories/users_repository.dart';
import 'package:users_todo/features/users/domain/usecase/add_user_usecase.dart';
import 'package:users_todo/features/users/domain/usecase/get_all_users_usecase.dart';
import 'package:users_todo/features/users/domain/usecase/update_user_usecase.dart';
import 'package:users_todo/features/users/presintaion/bloc/UserBloc/user_bloc.dart';
import 'package:users_todo/features/users/presintaion/bloc/bloc/and_delete_update_users_bloc.dart';
import 'features/users/data/datasource/user_local_data_source.dart';
import 'features/users/data/repositories/user_repositoryimp.dart';
import 'features/users/domain/usecase/delete_user_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
//bloc
  sl.registerFactory(() => TodosBloc(getAllTodo: sl()));
  sl.registerFactory(() => AddDeleteUpdateTodoBloc(
      addTodo: sl(), updateTodo: sl(), deleteTodo: sl()));
  //users Bloc
  sl.registerFactory(() => UserBloc(getAlluser: sl()));
  sl.registerFactory(() => AddDeleteUpdateUsersBloc(
      addUser: sl(), updateUsecase: sl(), deleteUsecase: sl()));
  // ===========================================================================
//Usecase
  sl.registerLazySingleton(() => GetAllTodoUsecase(rerpository: sl()));
  sl.registerFactory(() => AddTodoUsecase(todoRepository: sl()));
  sl.registerFactory(() => UpdateTodoUsecase(repository: sl()));
  sl.registerFactory(() => DeleteTodoUsecase(repository: sl()));
//Usecase User
  sl.registerFactory(() => AddUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAllUsersUsecase(repository: sl()));
  sl.registerFactory(() => UpdateUsercase(repository: sl()));
  sl.registerFactory(() => DeleteUserUsecase(repository: sl()));

  // ============================================================================

//Repository Imp
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImp(
      networkInfo: sl(),
      todoRemoteDataSource: sl(),
      todoLocalDataSource: sl()));

//repository imp User
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImp(
      networkInfo: sl(), userRemoteDataSource: sl(), localDataSource: sl()));

//===============================================================================
//Database
  sl.registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImp(sharedPreferences: sl()));
// Database User
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImp(sharedPreferences: sl()));

//===============================================================================
//Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

//ext
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
