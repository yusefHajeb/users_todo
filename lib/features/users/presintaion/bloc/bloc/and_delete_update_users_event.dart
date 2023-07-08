part of 'and_delete_update_users_bloc.dart';

abstract class AddDeleteUpdateUsersEvent extends Equatable {
  const AddDeleteUpdateUsersEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends AddDeleteUpdateUsersEvent {
  final Users user;

  AddUserEvent({required this.user});
  @override
  List<Object> get props => [user];
}

class UpdateUserEvent extends AddDeleteUpdateUsersEvent {
  final Users user;

  UpdateUserEvent({required this.user});
  @override
  List<Object> get props => [user];
}

class DeleteUserEvent extends AddDeleteUpdateUsersEvent {
  final int userId;

  DeleteUserEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}
