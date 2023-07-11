import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:users_todo/core/error/failure.dart';
import 'package:users_todo/features/users/domain/usecase/get_all_users_usecase.dart';
import '../../../../../core/strings/failure.dart';
import '../../../domain/entites/user_entity.dart';
import 'package:users_todo/features/users/domain/entites/user_entity.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsersUsecase getAlluser;
  UserBloc({required this.getAlluser}) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetAllUserEvent) {
        emit(LoadingUserState());
        final users = await getAlluser();
        emit(_failuerOrTodoState(users));
      } else if (event is RefereshUserEvent) {
        emit(LoadingUserState());
        final failureOrRefrish = await getAlluser();
        emit(_failuerOrTodoState(failureOrRefrish));
      }
    });
  }

  UserState _failuerOrTodoState(Either<Failure, List<Users>> ethir) {
    return ethir.fold(
        (failure) => ErrorUserState(message: _failureToMessage(failure)),
        (userss) => LoadedUserState(user: userss));
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
