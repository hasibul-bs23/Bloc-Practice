part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserList extends UserEvent {
  int page;

  GetUserList({required this.page});
}
