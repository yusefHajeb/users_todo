import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:users_todo/core/strings/message.dart';
import 'package:users_todo/features/users/data/repositories/user_repositoryimp.dart';
import 'package:users_todo/features/users/domain/repositories/users_repository.dart';
import 'package:users_todo/features/users/domain/usecase/add_user_usecase.dart';

import '../../../../../core/Util/failure_to_message.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entites/user_entity.dart';
import '../../../domain/usecase/delete_user_usecase.dart';
import '../../../domain/usecase/update_user_usecase.dart';

part 'and_delete_update_users_event.dart';
part 'and_delete_update_users_state.dart';

class AddDeleteUpdateUsersBloc
    extends Bloc<AddDeleteUpdateUsersEvent, AddDeleteUpdateUsersState> {
  final AddUserUsecase addUser;
  final DeleteUserUsecase deleteUsecase;
  final UpdateUsercase updateUsecase;
  AddDeleteUpdateUsersBloc(
      {required this.deleteUsecase,
      required this.updateUsecase,
      required this.addUser})
      : super(AndDeleteUpdateUsersInitial()) {
    on<AddDeleteUpdateUsersEvent>((event, emit) async {
      if (event is AddUserEvent) {
        emit(LoadingAddUpdateDeleteUserState());
        final add = await addUser(event.user);
        emit(addUpdateDeleteOrFaulire(add, addSuccessMessage));
      } else if (event is UpdateUserEvent) {
        emit(LoadingAddUpdateDeleteUserState());
        final update = await updateUsecase(event.user);
        emit(addUpdateDeleteOrFaulire(update, updateSuccessMessage));
      } else if (event is DeleteUserEvent) {
        emit(LoadingAddUpdateDeleteUserState());
        final deleteUser = await deleteUsecase(event.userId);
        emit(addUpdateDeleteOrFaulire(deleteUser, deleteSuccessMessage));
      }
    });
  }
  AddDeleteUpdateUsersState addUpdateDeleteOrFaulire(
      Either<Failure, Unit> ether, String message) {
    return ether.fold(
        (failure) =>
            ErrorAddUpdateDeleteUserState(message: failureToMessage(failure)),
        (r) => MessageAddUpdateDeleteState(message: message));
  }
}
