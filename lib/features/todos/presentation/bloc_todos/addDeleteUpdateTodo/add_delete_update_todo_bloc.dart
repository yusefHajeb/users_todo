import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:users_todo/core/strings/failure.dart';
import 'package:users_todo/core/strings/message.dart';
import 'package:users_todo/features/todos/domain/entites/todo_entity.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/add_todo_usecase.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/delete_todos_usecase.dart';
import 'package:users_todo/features/todos/domain/usecase/todo_usecase/update_todo_usecase.dart';

import '../../../../../core/error/failure.dart';

part 'add_delete_update_todo_event.dart';
part 'add_delete_update_todo_state.dart';

class AddDeleteUpdateTodoBloc
    extends Bloc<AddDeleteUpdateTodoEvent, AddDeleteUpdateTodoState> {
  final AddTodoUsecase addTodo;
  final UpdateTodoUsecase updateTodo;
  final DeleteTodoUsecase deleteTodo;
  AddDeleteUpdateTodoBloc(
      {required this.addTodo,
      required this.updateTodo,
      required this.deleteTodo})
      : super(AddDeleteUpdateTodoInitial()) {
    on<AddDeleteUpdateTodoEvent>((event, emit) async {
      if (event is AddTodoEvent) {
        emit(LoadingAddUpdateDeleteState());
        final failureOrSuccessMsg = await addTodo(event.todo);
        emit(_eitherSuccessOrFailure(failureOrSuccessMsg, addSuccessMessage));
      } else if (event is UpdateTodoEvent) {
        emit(LoadingAddUpdateDeleteState());
        final failureOrSuccessMsg = await updateTodo(event.todo);
        emit(
            _eitherSuccessOrFailure(failureOrSuccessMsg, updateSuccessMessage));
      } else if (event is DeleteTodoEvent) {
        print("DeleteEvent WorkNow---------------");
        emit(LoadingAddUpdateDeleteState());
        final failureOrSuccessMsg = await deleteTodo(event.todoId);
        emit(
            _eitherSuccessOrFailure(failureOrSuccessMsg, deleteSuccessMessage));
      }
    });
  }

  AddDeleteUpdateTodoState _eitherSuccessOrFailure(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) =>
          ErrorAddUpdateDeleteState(messege: _failureToMessage(failure)),
      (_) => SuccessAddUpdateDeleteState(messege: message),
    );
  }

  String _failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case EmptyCasheFailure:
        return emptyCacheFailureMessage;
      case OffLineFailure:
        return offlineFailureMessage;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
