part of 'and_delete_update_users_bloc.dart';

abstract class AddDeleteUpdateUsersState extends Equatable {
  const AddDeleteUpdateUsersState();

  @override
  List<Object> get props => [];
}

class AndDeleteUpdateUsersInitial extends AddDeleteUpdateUsersState {}

class LoadingAddUpdateDeleteUserState extends AddDeleteUpdateUsersState {}

class ErrorAddUpdateDeleteUserState extends AddDeleteUpdateUsersState {
  final String message;

  const ErrorAddUpdateDeleteUserState({required this.message});
  @override
  List<Object> get props => [message];
}

class MessageAddUpdateDeleteState extends AddDeleteUpdateUsersState {
  final String message;

  const MessageAddUpdateDeleteState({required this.message});
  @override
  List<Object> get props => [message];
}
