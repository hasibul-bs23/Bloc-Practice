part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class Loading extends UserState {}

class GetUserListSuccess extends UserState {
  List<UserData> userList;

  GetUserListSuccess({required this.userList});
}

class GetUserListFailed extends UserState {}
