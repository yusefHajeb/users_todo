import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/get_all_todos.dart';

import '../../../../../core/Util/failure_to_message.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final GetAllTodoUsecase getAllTodo;
  TodosBloc({required this.getAllTodo}) : super(TodosInitial()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetAllTodoEvent) {
        emit(LoadingTodoState());
        final todo = await getAllTodo();
        emit(_failureOrTodoToState(todo));
      } else if (event is RefreshTodoEvent) {
        emit(LoadingTodoState());
        final failureOrPosts = await getAllTodo();
        emit(_failureOrTodoToState(failureOrPosts));
      }
    });
  }

  TodosState _failureOrTodoToState(Either<Failure, List<Todo>> either) {
    return either.fold(
      (failure) => ErrorTodoState(message: failureToMessage(failure)),
      (todo) => LoadedTodoState(todos: todo),
    );
  }
}
